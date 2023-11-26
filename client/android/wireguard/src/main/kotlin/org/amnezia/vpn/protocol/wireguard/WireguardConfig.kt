package org.amnezia.vpn.protocol.wireguard

import android.util.Base64
import org.amnezia.vpn.protocol.InetEndpoint
import org.amnezia.vpn.protocol.ProtocolConfig

internal const val WIREGUARD_DEFAULT_MTU = 1280

open class WireguardConfig protected constructor(
    protocolConfigBuilder: ProtocolConfig.Builder,
    val endpoint: InetEndpoint,
    val persistentKeepalive: Int,
    val publicKeyHex: String,
    val preSharedKeyHex: String,
    val privateKeyHex: String
) : ProtocolConfig(protocolConfigBuilder) {

    protected constructor(builder: Builder) : this(
        builder.protocolConfigBuilder,
        builder.endpoint,
        builder.persistentKeepalive,
        builder.publicKeyHex,
        builder.preSharedKeyHex,
        builder.privateKeyHex
    )

    open fun toWgUserspaceString(): String = with(StringBuilder()) {
        appendLine("private_key=$privateKeyHex")
        appendLine("replace_peers=true")
        appendLine("public_key=$publicKeyHex")
        routes.forEach { route ->
            appendLine("allowed_ip=$route")
        }
        appendLine("endpoint=$endpoint")
        if (persistentKeepalive != 0)
            appendLine("persistent_keepalive_interval=$persistentKeepalive")
        appendLine("preshared_key=$preSharedKeyHex")
        return this.toString()
    }

    class Builder {
        internal lateinit var protocolConfigBuilder: ProtocolConfig.Builder
            private set

        internal lateinit var endpoint: InetEndpoint
            private set

        internal var persistentKeepalive: Int = 0
            private set

        internal lateinit var publicKeyHex: String
            private set

        internal lateinit var preSharedKeyHex: String
            private set

        internal lateinit var privateKeyHex: String
            private set

        fun configureBaseProtocol(blockingMode: Boolean, block: ProtocolConfig.Builder.() -> Unit) = apply {
            protocolConfigBuilder = ProtocolConfig.Builder(blockingMode).apply(block)
        }

        fun setEndpoint(endpoint: InetEndpoint) = apply { this.endpoint = endpoint }

        fun setPersistentKeepalive(persistentKeepalive: Int) = apply { this.persistentKeepalive = persistentKeepalive }

        fun setPublicKeyHex(publicKeyHex: String) = apply { this.publicKeyHex = publicKeyHex }

        fun setPreSharedKeyHex(preSharedKeyHex: String) = apply { this.preSharedKeyHex = preSharedKeyHex }

        fun setPrivateKeyHex(privateKeyHex: String) = apply { this.privateKeyHex = privateKeyHex }

        fun build(): WireguardConfig = WireguardConfig(this)
    }

    companion object {
        inline fun build(block: Builder.() -> Unit): WireguardConfig = Builder().apply(block).build()
    }
}

@OptIn(ExperimentalStdlibApi::class)
internal fun String.base64ToHex(): String = Base64.decode(this, Base64.DEFAULT).toHexString()

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761419;
	b=vuJYOYth6J1J+zEBzh55+HRKM7LbVwYw1F+yeTXecHqZS9YlIQiCD85zRvUB80TorZBk
	 DI0TOfEC8nRN3LM4BgllyuZQesTKZ0aqGpugFt7DTGKnfjqTullVV1qdv3ZkZwWbEd1I8
	 v9XVc/p+ocHvqw1dJd3FvPHZUDajEZNZv/clBU0KD6xi9V9WVwB2zG+Qf7rCKwgfFyCn4
	 n/wBxeLs4L20AT8aGIT6Nf2dcAaxLdanbcgsKtx7unRy3ame0mnmPOTeaCEX2/xHBIxBE
	 J6U4dZQHNy+o1AwSUOhbxk7gwoUxBQPRi5YBvTwsCVFsCSDlFQnaq6Ti0zsnRbdMdTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761419;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Ty6LuzFtb88AqIAQYqKH2ZZRAuUSm7+H2Pp27L58FdI=;
	b=W+k/Jj4BEK7cCDQkvA1qnXZhdAjXh3fpvDNYX6DhD8oQURXAqDi9HmfCyKTH+ExrhOdl
	 FJc9mnUKLk4q4xbAkMxFwpjgMFcpBjgTUbQaNK6xVca9lqTO3pRVpnbjQ7gjBMFEHL0W6
	 NWlhjKlw8FDae4pW2AmGrlNPRDOCr0HvQIsqhZ38d5WsdIPJL+hmgYGVMNM8PHOzYQ5Ak
	 V7/mz0Kldawi7T6VoAaHa+KGAnWg49FTLWI1kQTGS8KiXjAjzSKTryJBNrfT4DZskr33X
	 5vRLne+DD8ES+kTN6ooFMN+5VlSlE286veYGJ3PcP7h0leXjw7WAyepHucy/jKGcSAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=EQwSMO9b;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=g4Zm01hy;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20867606A31C;
	Fri, 27 Nov 2026 06:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20867606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=EQwSMO9b;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=g4Zm01hy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795761410;
	bh=VONfsLixoACpPhPbR5lTNFaA/lhKHHy8/VgHn41BZAI=;
	h=From:Subject:Date:To:Cc:From;
	b=EQwSMO9bW2ZAJ7a5ft8U21O1lP2FQGHodBY4+6WOMy0F3cIH9dU3w/k399M5B0VUN
	 esaiDZcOCtJJUQdDT7tH/cUzjDfXSahrVbXj49kRLa84A12NUY7N5edJMzMUpD2xUy
	 IJdJKnkipEWD+UJncG8RHnrxHwT9kTTfMKygnEzg0MIWGANwhjTbSGzXdTUYRYtvCf
	 0MNMWsz4kMXSXxCHFssal6XciZ/R+KVo//qq6Rhkeo0kMpTbbsK8K49AlZU7+Tk6FT
	 TPDhKM0wmSZUMDERXmMDPSIfih0B4eVz0dapGrbLdkr41Lr0ckE3M5oHFBHZnWlab1
	 TMxjbRIFZIPGA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id DF96A49636; Fri, 27 Nov 2026 06:36:50 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795761408;
	bh=VONfsLixoACpPhPbR5lTNFaA/lhKHHy8/VgHn41BZAI=;
	h=From:Subject:Date:To:Cc:From;
	b=g4Zm01hy3UCKmRfL0woTmpcpDpBr8DvYQM4idPeM6oRKI6HOw/MqRYW7Pu0ueq4AG
	 Yr+TvkU+AKdlShhYEGVVdZSTy5If4XuBmN+H3OwcnPSQYM7KL47dH1PBsK9ExbTZNg
	 3Chh7veVpW3D+ihYoaUSLRQ2xaRDvTOwDSwRdTuJpImENjXvwaI/8cm77gKzF2VqRk
	 XxmJyWDDPouBgMqOVNJCTGHq9xprNidB6d9+xw9MpyIF85XIa3omaLS733X8XPD5WO
	 3HyGPtj4N27n+iBMRVs1u2DU4wWqU76uFSKDTBh6/SnuBVUYVcNlESmTfiaSEs7ReP
	 vlULCMYVO8q8g==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 71E8D4962B;
	Fri, 27 Nov 2026 06:36:48 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Subject: [PATCH net-next 0/2] net: usb: ax88179: Support NETIF_F_RXFCS and
 NETIF_F_RXALL on AX88179A
Date: Fri, 27 Nov 2026 07:36:25 +0100
Message-Id: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOkkCWsC/x3MQQqAIBBA0avIrBNSwqCrRAsbx5rNFBohiHdPW
 j74/AqZElOGRVVI9HLmSzrMoABPLwdpDt1gR+uMsU5HzNpHxH3yswvBQC/vRJHLf1lB6NFC5YG
 ttQ88bchDXwAAAA==
X-Change-ID: 20261126-fcs-afccb4a76dd1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The AX88179A-Chip family supports reception of the FCS
at the host. This is configured by enabling the AX_RX_CTL_DROPCRCERR
flag in the USB-adapters RX-controls. For AX88279-based adapters,
the flag has already been always set in order to receive
complete frames, however, the FCS is not necessarily usable, as it
is only part of the transferred up-to 8-byte padding area, and for
some frame-lengths only 2 of the 4 bytes of the FCS are transferred
to the host.
    
Note, that the AX_RX_CTL_DROPCRCERR flag has no influence on dropping
of corrupt frames already by the USB adapter, even corrupt frames
are always transferred to the host.

Add Add NETIF_F_RXFCS and NETIF_F_RXALL features for
the AX88179A and take a trailing FCS into account for MTU
verification when checking packet length in rx_fixup().

Also add code rx_fixup() in order to Count dropped packets and those
with incorrect checksum.
    

Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
---
Birger Koblitz (2):
      net: usb: ax88179: Make receiving FCS on AX88179A configurable
      net: usb: ax88179: Support NETIF_F_RXFCS and NETIF_F_RXALL on AX88179A

 drivers/net/usb/ax88179_lib.c      |  6 +++--
 drivers/net/usb/ax88179a_devices.c | 46 +++++++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 8 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261126-fcs-afccb4a76dd1

Best regards,
-- 
Birger Koblitz <mail@birger-koblitz.de>


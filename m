Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795193410;
	b=1oQUBIgQVVawhiwe29nRRq2EQriwv9frSUIPiddTx0u1t/gwy6RjCdgLd/GGpUTD/k6H
	 96tccanJ7OlqjDyJP7TGp7GlLUk7KLATLGisZi9OiZdnYd/s2xNLHKYfNUW0Q25eOP6kJ
	 0p34uQvAvWZ4bd9mfnzDh9bTVesxfgYGrcLc88OaXWStnLZGAV4H652TKKH2G7SYfzMOx
	 Rki6N/IcGwnNci3gItAuNQQRsUfvo0RGte1N2eMPHrr0jXM6fDMKvbEm0WbzRy2MFLArG
	 Wmf0NGfK4vLQH0p3V6OVyB7kPSzC6HfiHnnZXhamLXGi13lZUMEi6JHwTYyg4XgzyyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193410;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FLfv1oOYE2gAwNkq9Vh2bVuQc6vMwDn27WwnZe7RwSs=;
	b=zfzWD5iiVsbs+FBp4wFDnrZ1MP8wfSTmX6thJ3jn2iqcJg1j+dWRfBsIhFRD3JnE7Q3/
	 Tn+zd1T2uX9BkSJPjxaWnSVCGsiYI8z7L/siqNBJCm9qw6QG8iebULXzxtuZ5IZjqJgEL
	 4xJduubjbi4jhKbl0A1iJYw9UFV7kcau4IZwAyCxUNOOSwlakZ2STV+UWCIl4J3Ofr99Y
	 lzVAEEsRtHeViWIxysVh8MoyrFNWm/ZCkVPsAwEHcbns32ES6WvP1bE6D7puSOvbJIfFL
	 2dVoGjuvar7c1PL3PsSnz2e4fqMbG/O6WJsPe/LRhSN9+UNNY4F5aDSUnmOkwVNkz+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPEJkERw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A815360A2609;
	Fri, 20 Nov 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPEJkERw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795193410;
	b=FnON4Bnxc4y78vqApqa58XyWYFLckE3MOKFnBGqUZQBqhpZo9+m1VZIDtGI9Z9oFwj/B
	 ZcHlu0ThJyj8rjSyetdLFp1vA2yGvjjrN4k9OeDqQhl9Zsa+gHw63Fv/0fPfkEGlwS03L
	 CaxfnFro8BkjYEx15YgkV5W8gNCt4IL9tetGkOV3Fqd9dijKPqrBGPRI/gas8n4mOzI0w
	 ogab6kIBpOAn1/Cg821V/BXJ0DeqjGYS5SYpxvnUydqJNzcH5pTH3d0H7qMcB07PMp+cq
	 bmlsjkRh1kVvk3Z/n3GSyqQ41DRcdstyBsn2+JFpEt1fmK6D3Mt5ZUSXT4JsdzvlVeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795193410;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FLfv1oOYE2gAwNkq9Vh2bVuQc6vMwDn27WwnZe7RwSs=;
	b=eJ8ZbsMaMx1/qVcyEH4kZUuVWxPBTF2nJdeOf2kEa9a4rkDjfTFjiPH1xqUyB1IZ3WU6
	 MtsZkmcUS+pks1n19GKqurSAl1GIodSSPt5NKnYbSdbjN9wvn3kJUXAbNiRqX+uNTOv3z
	 dfd02s8/mPaRG5Kt+SS5h+Za32tYtxVSZckKAVmPHiQNQ6g6KFlOiF+9MgJ9bt7sjL1S/
	 6/d7wO3DDvMuAbA3K/dNJ+N1dBxjYkiUS2W0hZEOGetKB+JQtTj05btFRd4+1rhit0Znn
	 uCfTHjtG0Od66hl+nfOCBbzKqNoRibDQxhAYWckmtfvl/iK4Pp2u9FPDSaBY+IAKv6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42EE31F000C6;
	Fri, 20 Nov 2026 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193410;
	bh=FLfv1oOYE2gAwNkq9Vh2bVuQc6vMwDn27WwnZe7RwSs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=WPEJkERwiaKUGAScKiK/gSb11VYs7OUtzlH2ImWx2z7vkrTsurwyq1QzFzBPFIzX3
	 BPQYQgHPrWDBmrUd8MHL8I7HYj1CilBtVEVxgqy2aqahBUKFg6rzyh7zK8ayCCW+Kt
	 5Hl2CqnW4K9ZaheQEM4CYYkhurKS2Yc64cB7/3ZjQw3XVkLHvyDv2HgSISarb4pND3
	 oMyQ3jCJfmjG6FbNC8cf5EPs2M95i7CJ8SKSQZAO74u77y9ShSw3SRKWbGnyHbegYZ
	 K87/E45MHylN40N/0Bk7We/xVGvuCc5+js2SfBJXk66wUvec8NHEJvecoOrDFQcFku
	 lKCGiSHl/uIiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C3D924AB68;
	Fri, 20 Nov 2026 16:50:02 +0000 (UTC)
From: Blake Alexander via B4 Relay <devnull+contact.blakejalexander.com@kernel.org>
Date: Fri, 20 Nov 2026 17:48:21 +0100
Subject: [PATCH v2] usb: typec: ucsi: log invalid UCSI version of 0
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
Message-Id: <20261120-log-ucsi-firmware-quirk-v2-1-bb9aebf0b308@blakejalexander.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0K6dgxtFNCV9zAsSpnK8FedAmIId
 7fgAVy+5PveW4RHJvTiGi2CcSJPrg+gDpEwle4fCFQGFipWiZTyAq17wGg8gSXu3poRXiNxA5m
 1JktNWp6UFeH9ZLQ07+Z7/mM/FjWaYdNti4r84Pizpye57f5XJgkSktAo01gn8pzdilY3WOsWZ
 92XyEfjOpGv6/oFIuNBGNoAAAA=
X-Change-ID: 20261119-log-ucsi-firmware-quirk-8ffc87c7d42f
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Blake Alexander <contact@blakejalexander.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795193306; l=3351;
 i=contact@blakejalexander.com; s=20261119; h=from:subject:message-id;
 bh=b0MQKohAyz7nav2UR2M4JLiTqoUm2vbglbqr05OCohE=;
 b=LqAwu7AW+izohmMiI8d9jjRUAzGwOvHNIHeOCSKLxjeiiFRRgtaD8JsHdJ+R7f+lpDeiy9cLy
 LU+KVCiA7OCAns87eXb8Cx4adhVfHUoGCxeQpuCKCiTfGMxZd795vO9
X-Developer-Key: i=contact@blakejalexander.com; a=ed25519;
 pk=csAgv2qq1q6RTYXyATg9ngFwpSFPE0yWA9R9nSvVxW0=
X-Endpoint-Received: by B4 Relay for contact@blakejalexander.com/20261119
 with auth_id=1565
X-Original-From: Blake Alexander <contact@blakejalexander.com>
Reply-To: contact@blakejalexander.com
Content-Transfer-Encoding: 7bit

From: Blake Alexander <contact@blakejalexander.com>

Some devices ship bugged firmware which sets the version of the UCSI
mailbox to zero. In such cases the ucsi_register() will return -ENODEV
and the driver will silently fail to bind. There is otherwise no
indication as to the cause of the probe failure.

While existing (and future) machine-specific workarounds may resolve
this issue by assuming a known-good UCSI version, future devices or
older firmware revisions with this issue will still silently fail.
Both users and developers will benefit from a clear diagnostic message
when troubleshooting this particular bug.

Add a dev_err() log message when a UCSI version of 0 is reported during
ucsi_register() hinting towards a potential firmware bug.

Signed-off-by: Blake Alexander <contact@blakejalexander.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi,

I have a ThinkPad T14 Gen 2a which is failing to negotiate a DisplayPort
Alt-Mode connection to a monitor-hub with a USB-C cable.

I spent quite some time troubleshooting the issue and identified the
root-cause only to find that a patch which fixes this issue was already
submitted:
- "[PATCH v2 0/2] usb: typec: acpi: Zero version quirk for Lenovo ThinkPad T14 Gen 2a" <20261103-ucsi-lenovo-t14g2a-v2-0-e85c659b56a2@resetko.pl>

Similar issues with other laptops have also been recently submitted:
- "[PATCH] usb: typec: ucsi: acpi: Add quirk for ASUS ROG Zephyrus Duo 16 GX650PI" <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>

And existing quirks are also already handled in mainline:
- Acer Nitro ANV15-41: commit 8c51ea651d04 ("usb: typec: ucsi: acpi: Assume UCSI 1.2 on Acer Nitro ANV15-41")

In the hope of saving future developer's time, this patch adds a
dev_err() log message when the UCSI version register reads zero. The
log message hints towards a potential firmware bug and gives an 
explicit cause of the driver's probe failure.

Tested on ThinkPad BIOS R1MET65W (1.35), EC R1MHT65W without the
relevant quirk patches.
---
Changes in v2:
- Fixed comment style as per feedback from Greg K-H.
- Link to v1: https://patch.msgid.link/20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com

To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/usb/typec/ucsi/ucsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9e453d216c16..3dddcec2f425 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2396,8 +2396,14 @@ int ucsi_register(struct ucsi *ucsi)
 	if (ret)
 		return ret;
 
-	if (!ucsi->version)
+	/*
+	 * Version of 0 is not valid but some vendors may report it due to bugged
+	 * FW and there may not already be a workaround quirk to correct it.
+	 */
+	if (!ucsi->version) {
+		dev_err(ucsi->dev, "UCSI interface reported version 0.0.0: possible firmware bug.");
 		return -ENODEV;
+	}
 
 	/*
 	 * Version format is JJ.M.N (JJ = Major version, M = Minor version,

---
base-commit: f11fe7603df07fbb9fa02b0d385c1696c87a6dab
change-id: 20261119-log-ucsi-firmware-quirk-8ffc87c7d42f

Best regards,
--  
Blake Alexander <contact@blakejalexander.com>



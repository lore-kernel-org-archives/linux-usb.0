Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679612;
	b=x3azammI3UVHLhyHOqS4ewXjIGawumKlH8Z0/8awAcQn7mX1cJL7S8ZWNDmDCJpMWdBt
	 MML9JfPTn4T/33e+MisVkyPlIf8mG7qQ2E2mVS3TXI6E0nL/uNWHL7AN1zE28MuJ6Y/v2
	 3dUYySuJ6HEqnOBo5vFYD9VvmPkKnRuWXqtxTwJyR201dAILf7KCU5C9x3RiTIUiSyczc
	 60hXn4DqXESuSt/krRMqhtm66JdKwpwYpuXTnAoWiVOV0xHIjf3l+B79pYrfNq62wtQva
	 +50ti/fr3mHXyoYAvAEa7clddOwk+5FHf21Nv1DlvlND/ZhJmW6ZxUsWGbsn6V0u7tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 Received:From:In-Reply-To:References:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
	b=dAApbRjJDri8JaxJr8r49B+4ThDL4njEzpeu/7DBhQ1F7HrN0ZsSlGvayHEU/dfpfZ7o
	 qFcURWczxYmF1mE+iIrSovsB9s661NgUwU7W5VEaInIMCLOwwfdV/Cq6AH5KJ9pcSNiTY
	 p1oFvaJekt0O9kWKdJlF9aD1na0ywreBGShvbwwzRuqAFuYh35oUPq7pWRPkEGGSSDjNh
	 CPgVgwoH3jfBJ3CtDArk98+1Rh/0sGGdDEYKQfg/jtisHVCkKfXDqjw+4b5/CHKKKWngU
	 ZEFSvnJ+Wa2HkNapXChy640VIa5GSClUBPBPM2V9HMBgFNgcQ6NJDQOfpEOjsXw+bVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJK59hEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E11606A330
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E11606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pJK59hEc
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4932b13c4ccso3780281fac.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795679611; cv=none;
        d=google.com; s=arc-20260327;
        b=Wh5KrwT5SqVArlwxkZxY/6QbhIWZ6ZSu2GcarhUV7k2IuoNgDRoNJRUKc8ms8c+Ht0
         +Efg+jKtFfAmviH+jLjU2Kxogs3yc+T1SCWdJKjOWINf9s+cctmzga/OxrIlB1Lq5cpb
         witJ+IbxaN6CIqbjgdKi4v7HeuQkNIvoPE0u/+ecnrEdlUmRBva4WFurMCe7Ynw+2BVr
         4lzhx6mE/Fhez/A95ETfGql6omGGn7sYSRogGNUSjFhAW1WMNVTQ4NPA37Ll3Zjz2A0H
         aGsRoSHiXtcNSeJFL5P+N7gJCA9BNFxmCvltJ/2vYi8lA6TWC6QPqKKsfxIGi0rF+Dtp
         RoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
        fh=uW0XYUSLYx4DU/FDhFl9q/odVc0v6vpfh+gHDAJi5Rs=;
        b=KNw1SwIy/+22P5TsQRMVvTWTRaHVqlS7l+thhGp4+LRgNqVLDGXoK/t5rQPyU4cfYf
         X6g/dbh2LneT+Ft+Mx1hQLqHkojLIklY4NkFucu1FbBfhu8Z5Rf8LDMQ+c25lQ0Bh12X
         lZK/0eKknPAgi1xWFgRdxCOY+j8KgYXXewpFa9SXjfUpeKCJ63VyrIhanbMa9XV92gPH
         yCWDuC5eG3VeiWj1oFOA2vzjN0gvvKMHsQN6vcZDUGXA0swOaegt2puPLWxoxw2JPG8g
         EvaMVC9nbXBgS/XYwFaqmymRWPr9nxn9DJmHjBAlCL6xgOEIlkf0NJnN+UBP+Uv3B9Tw
         j+MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795679611; x=1796284411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
        b=pJK59hEci0NYV3VAUFOx2VwXhMF3Q49JI9mO+/n6JBlJAuxY62KY6f5o+AO4Ektg+4
         g60uxaKe7VHvHmZUfECxnMmaquyQRvaZVUcUEzhco6OGPFB4MgDDwrDMEHvcvsE1WhKE
         050nQGFtc0S14UGgBZn5eug3dbjZdxBdIv4LDMYYSXs1ltnV12IBjDa11vnhyjvgoXvZ
         IzYofz0rZqb6P4LqpgXHF5LfxaL4gbXBc7Eo6fUfWkbe73NQU/d5xexuY1IB7hQ3OLY2
         V+HhamJc6e27xT5zUxlnGTxi2R5Q4Q/9oMxhCKetKHPEU0mWFUOfoIygulDNkbaXqXxi
         7V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679611; x=1796284411;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nRFfhPQGsTW/vCKd8orp1onKobdC4rOfX51Va3PK3QY=;
        b=oV1eOk+hlnPsuNj9HVfO/l5m/8Z2f14W9qfQbMPFl+g2x2MNKFLURnF+G+Cb9P1DYM
         +cf11mrSK1VdFUPV0hwnV+OM3CcSPPgF/DMEh4ybeLtW48W/hKX8I0+CIub+191Gy9AG
         d+bzsps24d0N86k08Y3meVqowAvXZK5IfYZXWFfUGsQqjKc6NQee60vRhubvbyaepThh
         EVMV87HM9eVSHuDWRH/5QTW7tFa/Ub6KPwkceCuzl0e6hH0xRWGlfqa89O3Vf2DGvC9L
         odFFWsFQAiHJIvJF8lTVmZShL0XSa3TuDwfK4lAy29N+LH1N/0EFkRjg7Nl/QO43CR+j
         lCuQ==
X-Gm-Message-State: APuU4Z+DhnL/rbH8ewAejEbjGOsoaltLjfln1hmgAPbGsjZNP97rKLN+
	qEZ03S4AdJBSkzE9Y5pc1xZU3d+vs/XAdbT2bwmR9Blm5Dl/AwJSCvg/jPp8u9izF02FxM+1EEG
	LdU8oGzUpvTfJRyyPjCp3ZDGVbn6UabY=
X-Gm-Gg: AZFdTZd372tU1mfoycV2qIaIN5KrzU/HJkeFg+ohjK9BiDuDAqVkonUUsY1FwjVTM68
	UWGSgzltdmf/encyPNkkYu4zBSiJ+7wTlnTy+gskh3oG417oKCgGBDkXEgRmkoifSjZycTLyl1e
	PKACgf4ZY00wovCDSOQZmLk9bK1ms9Fu1rKqAVKQzwsu9v+VfKb5iSPWW7PlCa9H3/rqB0l07fj
	7GyTqUo+cOWgQgDu+0Kj84eW2bkPxlJF+3h3RUzX+j4T+jZBXrSsVrqrGpSaQmvJyzw2i+/X67u
	n5Tb+E1GK1lkG2bG4D6hCS9RCd90u/qZyajd1zrHtSnqNbGgXIsmcAvmKqTGQsWYVSpExWE3jJi
	l1Y7qPfwyLbIJ2ad3d6ZSeMCzmaftLEfpeb9Ff/jh0aHU8wOr3EnAm+pjL8mtZdouSKCfDd3td5
	YvKEtmyVGp1u4=
X-Received: by 2002:a05:6808:c211:b0:573:4e8b:1f5c with SMTP id
 5614622812f47-57a0b048d59mr21586085b6e.35.1795679610811; Wed, 25 Nov 2026
 23:53:30 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 07:53:30 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:53:28 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 02:53:28 -0500
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
References: <CA+m4KrCtvNdz8o0abjKONb0Ys78VPk54egzCDydpvgyZs0pWuQ@mail.gmail.com>
Date: Thu, 26 Nov 2026 07:53:30 +0000
X-Gm-Features: Aa3M54rjQOTfrEGuME4pRYe3YlmWN6OOM-LJ3XqOYHFi_CfawFiykrKk7vGrvo0
Message-ID: <CA+m4KrA8u1reEQ8w0i8OXytM5SMhfu8sj_zSVJc5j8NpGv92vA@mail.gmail.com>
Subject: [PATCH v1 1/2] usb: typec: ucsi: gaokun: Forward HPD low on physical detach
To: Pengyu Luo <mitltlatltl@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On the MateBook E Go, removing the DP adapter can clear the mux, CC
orientation and HPD in a single EC update. By the time the driver checks
the SVID, the port is already out of DP mode and the HPD bridge misses
the disconnect.

Remember that a port has reported HPD high. If that port subsequently
reports no CC orientation, no mux and HPD low, forward the disconnect
even after the DP SVID is gone. Clear the remembered level so repeated
empty reports and USB-only activity do not generate extra disconnects.

Fixes: 1c2b66a7d725 ("usb: ucsi: huawei_gaokun: support mode switching")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 9b51b60b2..9cb7c9bc1 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -99,6 +99,7 @@ struct gaokun_ucsi_port {
 	u16 svid;
 	u8 hpd_state;
 	u8 hpd_irq;
+	bool hpd_connected;
 };

 struct gaokun_ucsi {
@@ -326,12 +327,17 @@ static void gaokun_ucsi_handle_usb_mode(struct
gaokun_ucsi_port *port)
 	if (ret)
 		dev_err(uec->dev, "failed to set mux %d\n", ret);

-	/* UCSI callback .connector_status() have set orientation */
-	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
+	/* A physical detach can clear the DP SVID together with HPD. */
+	if (port->bridge &&
+	    (port->svid == USB_TYPEC_DP_SID ||
+	     (port->hpd_connected && port->ccx == USBC_CCX_NONE &&
+	      port->mux == USBC_MUX_NONE && !port->hpd_state))) {
+		port->hpd_connected = port->hpd_state;
 		drm_aux_hpd_bridge_notify(&port->bridge->dev,
 					  port->hpd_state ?
 					  connector_status_connected :
 					  connector_status_disconnected);
+	}

 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

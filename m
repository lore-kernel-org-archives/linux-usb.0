Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226495;
	b=jJd0bb+ZraDlp6j/lXfyed1+cN999rkKczqQtZv90OduZIEBRAuMBOhvMPhZH8UNbXhg
	 mjDQLaAny2rV2fJAw9kWFl7R+uYQA33eFkXurRdb11wgFsHHdOyA5GMF38uMmQutQibsb
	 Y7mJxlZjz4a9jYcSkZr0AWcEyBANubb9XMNzpCEm4NB5cZMW3gnQ36i3f7smsBgIfakRr
	 +HYUGkmqBsE9Aopk6JNH1osY4YyVvgYFoxJx+IlnN+M186hWjEVBOdzeEdhrraEqNCyvs
	 4lhOQONUZbi9Rs6o2gXQfg+jLxdRNjEfri/atNZF7gTFNzYQI0sUtim/viKExZA1u0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226495;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=c9nNxsHjKnfDkOrla0IRUfyl7eVn4AD2MQVhH0+zpkw=;
	b=SOQbSD1UzAVQpWQh9QtwFwYNPnkVG/DQyb+DdtAebGV9fm4FVZnck3nVsQRPxk/J3U++
	 zpkaILMWach+1xFXAxQAudRBHaGbr7TkdxKgb/CuFJxuN81Ch5+sZweCqN+cnEWsSipKs
	 MI3GOMgCYYrcmaP+ejpqCqs3ump9ahlB6x/AT63DjYoFkMLXakoZscHzMWrL2OcD94u41
	 JJHnEk6eKLDoyNvM572+8ztkkG7pDBFBYHZQYmcRlAHOzm1BwgngeLtu1Bg0Hfrq3SlFp
	 wJAcstt2L12MWdVzD8a7tg9n8+B2G2cKfl7UrIqrjIRre9Dka6bt/oV8k+VDV7tJC/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=ASNxUCHO;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493F606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 22:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5493F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=ASNxUCHO
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPSA id 1328BB40242;
	Wed, 28 Oct 2026 15:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1793226489; bh=c9nNxsHjKnfDkOrla0IRUfyl7eVn4AD2MQVhH0+zpkw=;
	h=From:To:Cc:Subject:Date:From;
	b=ASNxUCHOV4xfLHEiqahxX0OEWBzlagricUqYlk7Uq278N9mGT6ynqoqucahAo4LOW
	 oEG2tVsV/D7HwPMAQpYMOgb8fUJgnLHWI536//hGDAjU5l5mT/mdEaWOLSutoFo8Ra
	 9dsCnPr14q5uXzV8vdOQBXFlE56V8pSUcsSwanIHPE52mqwI3hUPxoXfz6vfrsbOCs
	 xgGOHz3EWxXrl7VXrjAHK+sMjhS3nIyKCkPRxRJsrw9xHDxCGG+OSz7WUxJA3FVpyL
	 nocd4CU8z6n8Fedjia2HQKL3zKUjHKcMipBN36tWup1H32zPhO5B5bjGalwWlplXLY
	 0XdyN89dB7x2g==
From: Kyle Farrell <kaf@nwlink.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: pavel.hofman@ivitera.com,
	linux-usb@vger.kernel.org,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH] usb: gadget: f_uac2: prevent invalid bInterval auto-selection
Date: Wed, 28 Oct 2026 15:28:00 -0700
Message-Id: <20261028222800.782988-1-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When p_hs_bint or c_hs_bint is 0, the driver selects the largest
bInterval from 4 down to 1 for which the required bandwidth fits the
maximum packet size. The original implementation intends to keep
bInterval at 1 when required bandwidth exceeds the single-packet maximum,
but the search loop instead decrements bInterval to 0 in that case.

A bInterval of 0 is invalid for an isochronous endpoint. A Linux host
reports it and substitutes a default:

  usb 3-8: ... endpoint 0x1 has an invalid bInterval 0, changing to 7

Stop the search at bInterval=1. Maintain existing clamping of
wMaxPacketSize and warning about possible data loss when the required
bandwidth cannot be accommodated.

Fixes: 355a05dc8367 ("usb: gadget: f_uac2: Optionally determine bInterval for HS and SS")
Signed-off-by: Kyle Farrell <kaf@nwlink.com>
---
 drivers/usb/gadget/function/f_uac2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index d8cf710085a0..9bd59ea5f7fb 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -728,11 +728,11 @@ static int set_ep_max_packet_size_bint(struct device *dev, const struct f_uac2_o
 			bint = opts_bint;
 			max_size_bw = get_max_bw_for_bint(uac2_opts, bint, 8000, is_playback);
 		} else {
-			/* checking bInterval from 4 to 1 whether the required bandwidth fits */
-			for (bint = 4; bint > 0; --bint) {
+			/* select the largest bInterval that fits, or 1 if none fit */
+			for (bint = 4; ; --bint) {
 				max_size_bw = get_max_bw_for_bint(
 					uac2_opts, bint, 8000, is_playback);
-				if (max_size_bw <= max_size_ep)
+				if (max_size_bw <= max_size_ep || bint == 1)
 					break;
 			}
 		}

base-commit: bdf12cde30830d46a8ef1ba93986356f1164b4f1
-- 
2.34.1


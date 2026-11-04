Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778147;
	b=MOhmfdft+fysXyLloQFNcA1l+1+xs9Na3SgzZpqfgCtYQTwBcfcSYNt2hqSHhJpr1fuS
	 bM39JYblO9cj322nQyf4yP65wY36XY9AwlF4nPwRLZR5WQdGQv2JsXTG1S9V5nwDnnTyX
	 dgfM1MAyB6dVpnntI+Wg/dNfeJVx1w69RaMZYSQjx0RacqHouvsSBMYKRN7Rb4GGRmwQB
	 kbnDJ2iS1MaYdEVDtpcMFTnUUzlAzky37/zv3NCd+8sAgr2HU4r4oTM6F/hwt5tN+nEez
	 ARc8OOGECNKcJqMKO7SIJREvrFPwZnga8mFF5K3XhCEnB3Unkt/nN20RpnriNNtJdKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
	b=zlHUCpFyAvzGhZfWd+4AA8uBEktrTj6h95vUQ8AeuRdK1dtNFKilt+2BglvclyUOQ53a
	 NdAsijCv/cTQST826CEw3qjvCUTljyxXFY+JH7ppGThkt+RyASJ2YrQ2m2uic5KTFsp8V
	 6V3tqtjTFQMmsrnoR4rJpu9GOjQsAuxyuOyVC73/3CS10amMxiYavIORI6dDcjEKQ007X
	 h9S/WjJFfEFsh3hFAdmJpsqH9z77693q2GGDdWUQh3Pp0P2vZRVhQDKljCZduxcMrv+bf
	 vy7jYcuItUU66p6h+suUW5Z/at5L9TQ2Kzl7WW2PAYh/BsHnXvJcN8PrbDFTLzy/86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DpKyaGe;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B440F606D803
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B440F606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DpKyaGe
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so416665c88.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778146; x=1794382946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
        b=0DpKyaGeelhqhK2VnYs46HrdUzesWLRZfRJMpxsYlXLJfFzF8EcddpY8RtqVyvHT+f
         tfiH3hjXHQbDJ9x82BGbO/9IbqSX8HiA3bzRD8cZUzlzp7rjNXhO7EPV4mF2RCW+OIKI
         H+XkeaqccD2kbJ1tj36g/VyOiv/0mlRaBt5jSlAUzEvCakkK4z/+lYc6CTncQktehuWA
         /+GSGNTZO38C4wbB8KcKw9o++AU30XfMdPElbWPWpOdY8ISO9fBxv23Az1OE1ul8hDIi
         3lhVrJuLFddh4/1sLboE136iaqVLBMWNi7c/dr9kPrnqoWtiErXslU41gTOjQaorcBI8
         U1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778146; x=1794382946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywH8oMKlX3jURbfZOh+Ks/EFVKolkyAyAwEMCJeFd2Q=;
        b=XSqZ4iSU+ROTuRee/spaLqr+zOxZKJ7v+0xKNSVJ0fMdH8k7BKjb8tozzYl+85eeeP
         KxerX5fABzXZt771UDLU5ZVV8/84SXTrmRgSAcpaoOHSnTFHe/oH+wVrkjPJ460YBoPh
         ESXfj5aYTpfY6nHlKl4UzrAisiZYLwTS70kogMRYDamVcoWENoOpnogfB8jIJeD47IlD
         MuBLWEJ1GcAbHuSaNmPSDU6qDL7LY+qHTlkxMcORq9057E73JE+CPqSRCd9x/bIh79jc
         Vq8wFNdt9jlIU9U5W7qCh/P46bjXLo9KsE/OzFCuT5VDhjGnOxeKJotEtUdSs1RaX8NT
         zgmA==
X-Gm-Message-State: APuU4Z9D1qlUwS8PerFElG3RLYs/CfL1APzEHbxHuwJ8a5ylWld9DhKN
	UKqsMV4tJmLSHzNf7UfiurfDIns5Un5KlofSAewCyphG4ZGHdtJlaWuwvqTQxA==
X-Gm-Gg: AYBFou2I8Tl4LU9HL1rfHE/ngg8iEWEnXVvS/wKQFhNid6TLgsY404iDh323fZN22bF
	Bzu/FLnnIZzuklekHyoya6bc/60lK3vBzOyBFzU7A8EhZm4q1/J2vUk8ZzYSJ4EELWW+pV4iVaW
	6QK0ClTiLCWjxXhzWK7IRCeR+ZE0HFHz6sPR/zJlw8rwULbXrE2Avu0IuFd8z1D0qTrN/gIbzu8
	7Q9lHvUBvzSSCvwRFvX3O4X4VCItGGlqFQWAeHwqdMC8MWSaanA/mNrSPn31xtBQob2aiEQzUz0
	fsnYspaYpHX9x7JOtSVRR8lA8CAUGXzyBRjCc2H0F3viw5X0nWZBXoQM9f+kOL75G1izAPqUVX7
	UhexPqdd8x2Hn8dI1gATXl3uqc3dWI2dyJfHcGX6vcjDk7l+cG9rrj+fRUdj+kl7DyftEG9jYbd
	zOjSsqVe8bjA38N5xUS38mHL899GHJhS2x638cVq1Krkf5hsVbUFlIG6Y+JK2+0bC0TfxT2AxIM
	3fjLscM+bbNQwXCez38J7d/8tW98SQ+GCoUY2QFJr1LlwRQLRKqsolV+95bRZmIYxewWIBt24SX
	2w+/sLyDwp2nHYH9p6enMUbXUyFv+Hn/l9AQUzNCWL8DH7/I0N+a
X-Received: by 2002:a05:7022:f507:b0:190:d9bb:281f with SMTP id a92af1059eb24-1ac5e3225aamr22064013c88.18.1793778144624;
        Tue, 03 Nov 2026 23:42:24 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:23 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 2/2] usb: typec: mux: tusb1046: support HPD_IN override
Date: Wed,  4 Nov 2026 13:12:02 +0530
Message-ID: <20261104074202.76712-3-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104074202.76712-1-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
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

For boards where HPD_IN is not asserted by hardware, software can
force it high over I2C using the HPDIN_OVERRIDE bit in the General
register (0x0A).

Add support for the optional ti,hpd-in-override property to force
HPD_IN high when DisplayPort mode is selected. Clear the override
when switching to USB or Safe mode, and preserve the existing
bit value when the property is absent.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 drivers/usb/typec/mux/tusb1046.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
index 34ef81f75693..c21b1f8b9786 100644
--- a/drivers/usb/typec/mux/tusb1046.c
+++ b/drivers/usb/typec/mux/tusb1046.c
@@ -21,6 +21,7 @@
 /* General register bits */
 #define TUSB1046_GENERAL_FLIPSEL BIT(2)
 #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
+#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
 
 /* Mux modes */
 #define TUSB1046_CTLSEL_DISABLED          0x0
@@ -32,6 +33,7 @@ struct tusb1046_priv {
 	struct i2c_client *client;
 	struct typec_switch_dev *sw;
 	struct typec_mux_dev *mux;
+	bool hpdin_override;
 
 	/* Lock General register during accesses */
 	struct mutex general_reg_lock;
@@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	struct i2c_client *client = priv->client;
 	struct device *dev = &client->dev;
 	int mode, val, ret = 0;
+	bool dp_active = false;
 
 	if (state->mode >= TYPEC_STATE_MODAL &&
 	    state->alt->svid != USB_TYPEC_DP_SID)
@@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	case TYPEC_DP_STATE_C:
 	case TYPEC_DP_STATE_E:
 		mode = TUSB1046_CTLSEL_4LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_DP_STATE_D:
 		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
+		dp_active = true;
 		break;
 	case TYPEC_STATE_SAFE:
 	default:
@@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
 	val &= ~TUSB1046_GENERAL_CTLSEL;
 	val |= mode;
 
+	if (priv->hpdin_override) {
+		if (dp_active)
+			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
+		else
+			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
+	}
+
 	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
 
 out_unlock:
@@ -131,6 +143,8 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->client = client;
+	priv->hpdin_override =
+		device_property_read_bool(dev, "ti,hpd-in-override");
 
 	mutex_init(&priv->general_reg_lock);
 
-- 
2.50.1 (Apple Git-155)


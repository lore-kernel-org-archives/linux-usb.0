Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B293F8881
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484042; cv=none; b=ciUdFPd610pERkyvICvLlSTVnfgBzClz3VwUlbgD6knzdiVtTWNwlS2AZGawefe5xGFBgJmi3sh4tD9FmfZRUTP6V1vNCWGC+oCNneCCdCTn5jX3tDlurS48uwimMBQtm7z/uEwzti72ElPOZNil1XOb37dfmT5MWC+l1i0x0sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484042; c=relaxed/simple;
	bh=uN/IBN4vntgrjZsO3w5tBaNGdr3xPxH8/Ni243C4nwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCJ8Ox1enWqlt7xV9/NV24z5SBeWcyVZ+91QXEvngSrFsrgQswUnEdnSJfucwAORrMkE4uX2Q/APje1tT01RKFKmcJYPYbSQpym0pv6SLpt6IWzTyR34eMJGx5gf+UKzffaej9Qbi3txdBsicit4o3OHTDvRHDzd/OVuWmjSMRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QMPpvHw4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QMPpvHw4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c122d85eae1so108033366b.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782484033; x=1783088833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw4wOLtu6rGFY5GLKzfmFRrF9cJ0E7efDRcBVmIxEXw=;
        b=QMPpvHw40Jqebvo9wPo95DfU1BU9/FvCUn9eXB3YoVkK3O0LwYYatVzvxHPIFI1W07
         3RtrrN7Xz43iTyma5tygyuAYvxhSsrcZQr22opkFGrLaXsJTj7XiancsF+ZDEkzPWla8
         hz76BeoIqdni7JpXArubWIzIdaMUiNmuG9sUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484033; x=1783088833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw4wOLtu6rGFY5GLKzfmFRrF9cJ0E7efDRcBVmIxEXw=;
        b=ZXNSKD5mRwzS8DUuuxL162K6uWZdCsRP/MUOgAyAlhW4kc0ox79S59SRDGLtpsk/OP
         SGaUxTpSvclrsIMXjOsoRMsn3irko6B/zdzuLhLbmm5dkvZINjjh+m1EMsQcRGcyP4X/
         FFzjE56WqbXU9gf0jsoTO5hp+fBRcsM9oZl0rw4bkiFpRxg26V8BGOH4w3UDnJm7LufC
         kwHM2mKuIoKYaPssslJL/wjqDLkhZLEfukaKf6LKSQFeK3nbIaeBanRyTa/lOPzJKEbV
         8SBX+GBug/j9S8MvdkQOyxGys875eB63d7zRFiB5xYYJN7XXRSDMXh6KivsYwtAeqlX/
         s8AA==
X-Forwarded-Encrypted: i=1; AHgh+RqrtjyspvLHCjD7b2SFK0QAkKeVJbDTcc5kPNDvPWaKzyxdtI8J5hTTFIePwUk66bnpzQwP+1B5gBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqmuou5Mu+F4ajktN9cFnvowFXni5+HmpssdAhNg6tAUR6N3ui
	JG/tfqfI06LVoz0N72poFd3uPZ/4byqxFqc/KruVJNZEue5sR5+8nELpLIECNdXk2w==
X-Gm-Gg: AfdE7cnhBebUNcdINznC6o4Ccs7AbJIaMEkVK0QuxLb0HPak651IkEGjN2f7YooxqnE
	kyj916CA2tEtS8nwAiyBSYlFRCYLRkIK+ZY3GKzGZ9//tQty4Nw+u9BKxFLCdFlGbY+xkYVncbZ
	y1XY71FNOzdUUJuSiXMyivNGQ0AAUDOZvCNGGBUgz11Dq8TtriMJsReq6nQmRSYrzIJ0w8kocOw
	sEzPRFhqBWjH8/VfQB8RabWz6UXRTqnDm/gcfmarMrHKrvrMsgYxRXiBlPWlZM0kSot/UCjAtHX
	4EhE9i6xP8ZOcI2PzHi+4uFXdhVD8cJMarPzgcRdZs8GwsfpCk9vD1V2MU2duJd8+SSqQiVy/tl
	sUdY5qKcqeMl06bNQwPIzaRFMhiKdIBMZ9o9e2yL2JrpKuE1vj33YhHqxHMfXlOTVv1tYrx0hbl
	3VGmZ6nNY00Gt+cb48Vc7xht0viHUplsfpPFCSjLKGPZoa6Aqcd+Gg5BTKnKH1Go62iHSLdOHtV
	jgPgpHibA==
X-Received: by 2002:a17:907:72c9:b0:c12:301a:30b6 with SMTP id a640c23a62f3a-c12301a3f67mr95952366b.12.1782484033295;
        Fri, 26 Jun 2026 07:27:13 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba6787sm355968666b.6.2026.06.26.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 07:27:12 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 3/3] usb: typec: displayport: Check cable altmode support
Date: Fri, 26 Jun 2026 14:27:02 +0000
Message-ID: <20260626142702.1941182-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626142702.1941182-1-akuchynski@chromium.org>
References: <20260626142702.1941182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the probe function to utilize the new
typec_cable_altmode_unsupported() helper. If the cable doesn't support
DisplayPort altmode, don't initialize altmode_ops and prevent altmode
from being activated.
A captive cable shouldn't be checked; it may not provide discoverable
capability information, but it is inherently designed to support the
device's requirements.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/displayport.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 263a89c5f3243..5ee33a69b9cf7 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -790,7 +790,6 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	dp->alt = alt;
 
 	alt->desc = "DisplayPort";
-	typec_altmode_set_ops(alt, &dp_altmode_ops);
 
 	if (plug) {
 		plug->desc = "Displayport";
@@ -811,6 +810,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
+	if ((alt->vdo & DP_CAP_RECEPTACLE) && typec_cable_altmode_unsupported(alt))
+		return 0;
+
+	typec_altmode_set_ops(alt, &dp_altmode_ops);
 	if (!alt->mode_selection) {
 		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
 		schedule_work(&dp->work);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


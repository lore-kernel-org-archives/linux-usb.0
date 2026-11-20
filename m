Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168581;
	b=yoI3fu0Zv2FOzriQeYHpK7ALtKOLydsPx1PH9bpIzSx3Wqi1aLHuX2wTmnUwgFE+0rvB
	 vt96ozztXDAimDrFTw6f4Psb+qL32ZYFFGnpEvSwKOgNvWYrtWcyUW9UZUKYN262Nh8+W
	 hSQwGBIfu4r5yj8R1nYitd39C8PH2YXVFf+YydUzU7jJyHhuzBaLsvKQkeBZ5Z+iLMtea
	 CFe7hEyGqSxUK7gPiYRcVFizUXEBFn8/FQCZ3TQSaXszi2AZyho5TsNNYb7ROBxyQlp3r
	 D3ZxZYjM4iuz4ErwsCQLaNQH0xVgaajv6IXpFOpC2IPOGEHeYUDHYq9f8cNIfFfuhtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Lv1hMdrGV6lcDc+ZHAsf9MP/3WYy0zcj8WENnVEBfgU=;
	b=FU1xhaTxO9mfvtuOUAmP/8lffomwkfbjXzJ/ycmzHSky4cVGV24ZyiOKvSjmyLuQHHbi
	 E50lTEfQ3am41wqtE+jDn/5RVr8lwfIyUSXicAupT3iydREE2MyA+wepyzsO1oyLheWB2
	 9V68jBL4SiZG72upu1v5E400wc80qOtlj07SfezG0BCosLEUV+mcJwugzJ/a6Yyt2lKc0
	 rTU2xKuNas9jMlrUIgdirID0zLAjLgzY0yIW/ciuEKYqyIpwvfpaaMmozJL5qctmeDLfd
	 IN5efJvTBL4SZnbZSVRz7e6mR2TnYKMaHpATqlYc/TxioF7Cg9Basfflc9H3nWMj4Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gAZlj6Iq;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C11606A32A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C11606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gAZlj6Iq
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so5009405e9.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168580; x=1795773380; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lv1hMdrGV6lcDc+ZHAsf9MP/3WYy0zcj8WENnVEBfgU=;
        b=gAZlj6IqekXEVfJlggjfv07DOWW6/7cYKnlC6avwAGwiXMJyW8YVrzL/GxhFWRa4HS
         20CY9aZZkCXPpfwmshL5IBBZKw5DpekkU580DsPGlGcJPzYwX407GeYZq7locg3Gh1kG
         0yD9TYuQ0G/VzkVOrG3TkTgbswsaQDEXGn/H+g5E6y1bC5gn0OappA+od9TG0pZk2yrV
         JVxX0Kk228/UB15RXZnzKnXAnV6Fj9TNi9cuxtU6O0KvRq/5k02Exq+RVPtVoG7g3/pH
         hnDnX2geutmNmkCF4Rz5vAlx2XNUSRMPb1JwTtQkG8eJVnvgB1BiXMixgrzxsXe7YiZ8
         7uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168580; x=1795773380;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lv1hMdrGV6lcDc+ZHAsf9MP/3WYy0zcj8WENnVEBfgU=;
        b=nXRUMzwEbIXuUASmqqdf5z+99JNKmlJRD/SNokO9u77qsDnHk6UR5cRkapng0jmBh/
         w+HItR4pAhk+p7tElVTHaD7Cd+moWfjMY5XV15GsZD1v+J8xT4PlJUjkEyCc8pZVZRp1
         PuuHbzLTJ2PssailQz2ye5aKINYaG4irMErs5RCPrQ+Por3+dUbtADdridkl2Ykb9/xZ
         SF7NN9Zy8r/m2gk5bxUEoXZtdMA1jQqHXAkEf8Wic9asNU4K7BJb80dsR6aO5sm7zHsC
         N0YangUxTKVx8MvOOZIZ8Xnp+6+3E8bKmgv4rr+nVdJ2xZ3vBppUcPesaWoY+90SCC9a
         QYIQ==
X-Gm-Message-State: APuU4Z+twYSAOwZIdTJOk4ei0ejqoHe7hSHLgnudqByUfIeDXgJLMFw2
	LOGp/ltBB1kiZYuD5mnKD9rhvsj965/Yv9EKhTD3zVNQ2j+RSTSBVk5KZ8dmkuabTx5o556RuwP
	/Fr4qBTo=
X-Gm-Gg: AYBFou0gdLRGvQjPB+dGSXLY5hS1WMi92kXw7eY1+cbPPkAorik2lwwqETZCMZSRke4
	3LJxePCYj3q7RmOJdGNENUKRhKP9cZvvbf8Ki6VHsc5+88qQi1PIrhDUNoeWawLOd3/UTPvMYXz
	WPq8oTyaEvjJHET+XuVx8zBCGLTB5Gz+DCa2cF0dIxwri7FG/ntcscK7zEzItSK4VEqxV5F0bCo
	BxSCKjGCbfQ6sn6vsFiMGsuZ2qyi5X/Pg3MzEHRyU3+8Rjn24BzqecdlPOLkK46gdWNiH05jVuj
	L7+71ynLnocRNoF9tjhhliFEJSHeIiOe5TUSMcYZjPIOrWXP1gOeECP8thaxueEsGT+8Wp8ob25
	s1XoAtSzUBpjoufz+/Kf21S94axob0kZ2WozwG1o60DtlUkoIvea6aibzxVHTF0BBw+7x/3LGW6
	eydV6+DMEyvJoat9AMgCcvweFCixIiyr/ywsjXF5sJjAILanpEiAhxetBhEh6MJERnB3YGKLUpO
	bmqWif0lAs2WBESQMed4o9IrEIkLHGpYrhOV2LR54ZdEHnpyhbpdLXw5qEbdFOgLd1r7dWwdN09
	nb6gxRZ4pS3hG/PnCbo7I2jZdmGlPQMwhwqHZTVsLpacQrPL6rIyBrrdsVhHoMgJXGZeiZDl
X-Received: by 2002:a05:600c:530f:b0:4ba:6d8:dfad with SMTP id 5b1f17b1804b1-4bb88811eecmr50126415e9.14.1795168579630;
        Fri, 20 Nov 2026 01:56:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm149124555e9.13.2026.11.20.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:56:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] usb: tcpm: partner sink capabilities and altmodes leak
 fixes
Date: Fri, 20 Nov 2026 10:56:15 +0100
Message-Id: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAD8ZAGsC/yXMQQqDMBCF4avIrB0wKYp6FXERx6mOUBMyaSmId
 ze1y4/H/w5QjsIKfXFA5I+o+D3DlAXQ6vaFUeZssJVtjLEVJh+EMFF4IfnI+JQvK9Y0Gde4rn2
 0BLkNke8hp8P4t76njSn9zuA8L+9MymV5AAAA
X-Change-ID: 20261120-topic-tcpm-core-fixes-5cb1a6a9838c
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=638;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ABTe/CMW+uneLPb0+x4INHD8usYaqAzWMzH4S3nWxqU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABlBLyUA7GhYb8kYEwoJQG+Htl9VB520u9KuWjT8
 YrPZkFuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZQQAKCRB33NvayMhJ0arjD/
 9+WjkSBvHCBR61F1mfk2BrwAnS7T6VJJlq2yTM73ABCqaTCbFBZeZa4Jzvrost9jFS2FOrCuw/U4bR
 6NMefRxSWuMAqP4DZnQ7LZbOqdUlNGrs7y9J4STrqBRTBtqtyO9FyVDmcbtx4mxpF0VcbrfgSgeric
 1uPtx5s8DTSJm7tkGah8W9QTd/zMJG9EKSUvWaTs3/asjf1wv3B2yqhkTEyHwzj7/VZtTgJWp7V9JN
 hJtPi2/FkFGY13AXxYkyaKI672FEjWncXA/AQ/BUEopTs9Kyuyy2VM8LPswBiMWb1BMqXD9v4MhXKy
 jt7sGB7uDtcEIXFiki654DuZjtFsY3nVr2+s9+OnfOKV0P4gjZnPVEDPmSbs9kHTyp5sIg+VLyg1Rc
 YMefNjTUkciFRgeNWyNMGsUbN3szFy8Proe3PbwUGpVQ6tKfwbMsmOHZ4c5Im4Kz17TMSeuW08kCbR
 l8Rp1xkND4zfcZkEJuPaaHpnSk0y4OarNLErwaZZtjkQPKfoV7uUCnOktxwxJQHun06ocjpTp4jACO
 gmnbyuWMyx+TF88Z5K8xFCRBBtMtVfTi4iZZfUGbIL4a1lcuSr4avScosmv3J7aGNMJnBGCTXF5nj5
 YLcPgFYvKez1FmvVJJontsHZGLwKnebiFBG/hfJ9VtYcy9+TanCuhe4tezJw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Two fixes for potential leaks where neither the partner
sink capabilities and altmodes were unregistered properly.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      usb: typec: tcpm: unregister partner altmodes before re-discovery
      usb: typec: tcpm: unregister stale partner sink capabilities

 drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-topic-tcpm-core-fixes-5cb1a6a9838c

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


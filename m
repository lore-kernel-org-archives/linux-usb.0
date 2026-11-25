Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604663;
	b=OW3If+aZR58dOXh+4Q0vPRvkEYnMojbJ/6MDRNcZNANf9A37Paz2HlwV4gSwk8xyDW+D
	 1o0JjkS7Fp40F18hFKxexsf7W7QvbjARoMRoK/w8SKzeigR6YJF+fH8jyZDMX/gkvcqSQ
	 Rgdfb125pdARZRFuQqabT822ALr0xKOrwT9dfDdZpd3DPW2i0PnesSlFMRpYfBgODvcyM
	 HAl9fVkNke50PBnQ/6AOsN6RHjb0iUBXZDdlTT//7kSS8S2fYkrU4Q6gbCwA6R0A8EbKr
	 8+hZvhXwGjRYX8rDUBeir89NQuC0Nzsm7YOlKPENE5DTTJexatjK3O6yQVD4KwJ4rRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0825kkq44XsDveodw8cvj5KPn5N5qvk6oHlKWJUXcFA=;
	b=4QY31wKq4qdmas1VSQJkiqZE/JViqhxhGu8lYhJf6IpXulKiFgXRTPNnb8AzPN8uvsvI
	 ADfejuHmpquiRPsPrwJKUFSfMDC+cnZ/XScMAQY+zzwu/ligVXVkbsjEfRPoDQWQJ6vih
	 TKdpeSk+GsYfp/UXWoElqYNhanEhb/O4cGFPseYJqi3ZyTpksXiDayN/SV4Cqbkzpk6wi
	 zgjJB0mDPRdq7Tm4FADPedZfAy/LXpk2zwDbvj4ZYrpQN25pNNjVN11hMYEa2EeK7nbLG
	 elYcJ9jH3AeTEY0nFU5l3yeIxtiMEerthLEHuoOxxV9dIZy0eEEl6JVldHnbtqgu4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nxHxlfsJ;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276EB606A32E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:04:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276EB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nxHxlfsJ
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3330843f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795604661; x=1796209461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0825kkq44XsDveodw8cvj5KPn5N5qvk6oHlKWJUXcFA=;
        b=nxHxlfsJScaJkqSlCp5EDe8Z++zGF2Y9ulI439QJlYfxkM4FosITvzfG/UGtpJlryy
         wGfJH+Aefw+4Qj29ORsaSngZJCzfIiLtgPRBUCIJA/fOrtG3C83zDs80aPpRbA4UOZcu
         nQu8fb5kn5Q6WuyK56XbpQGBmm8q/Vz6m+iQl0CH4aFt02ympgt4F65C8tmDhr4Zd0Uh
         dK5whj5GBbsLWU/yZC/kqFR8UgDJvkPkqJeVEF0+6TlHRE5NluW9hp4SG1QLt29Myt7h
         foIO7G7fuozHuWamKxm2IUl2kkXpCUsQe94YGM2ODT7+MXvakUTovciYXaqi6EaB9nxR
         MAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604661; x=1796209461;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0825kkq44XsDveodw8cvj5KPn5N5qvk6oHlKWJUXcFA=;
        b=Far7uIQjcNvmIb9HAF371jgz0FeNbB+wUaARwChuALSWe1CoGhC9lyzpY9ef9xpTfm
         ZjM7nn81K74mbORVK9B7e2z3/KUa/fi9+54VOywdvxFnC+2j69gFFO1ftb4AANRKVTIh
         VwBzXDuXU7TZsY3YV6SdTy5Bp535v47+saWPLBxKO84DPOm6S9wpgeAe4aI0zMcVNvwP
         bqXoe3/BG3NupqF6x05yLaaEkP7gteuRFt+b/DxnlOUN/K+usnr4hmzlR0SD1mvHg+Tv
         ePwnoinqMvSU7zY1ImiiXRwItOCZOG6rjS42IKBB5Bo2DTJk07p/MtY543uL8SnNiGBX
         Cn3A==
X-Forwarded-Encrypted: i=1; AL+hErHFCG9CBjXRRNZNv3xEOb37BquUD/gZuhNZSDkbX7rq1rAdrfBa1BEW5Brr8YXmUqs1xXkhTiafKp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lLfqD6f7ppfmOH0F+cX0bNwi1jeF9kv/yv4cJOsLxMCINbcd1
	zt4aa//jyrjXSDbJPSfLBGHtrYvV7eT/Y+6bj2/g12T5tV96wpMwwoQ4DiiZgRJaAcQ=
X-Gm-Gg: AZFdTZdtRVPkLoSIHk4F78l1IJlQ0+R/RN95EAN7thlynUPrn0gB4P+poDK7QFPnegH
	XZgW9ZLz+zx5kpFPz/GL3CCjpzvh3hSi35vebi9Cs4c7jMzYpJjI7y1Qn0uqFK9NC5ZWpiZKrBq
	SYnpXf8tFchk6ufsdW9XZFoYNx7T6WFxMK5Hm/Ul6gjLOQop8fUt9WPgk011KJS+KLPxiewEmdW
	ySIJwV3foG+zLgmhCvBhOzDxPbKuW1gqFrREeygSVCi9TYCAqCFmLNTq4Ur0xueoVGHJTYaBJS/
	uKD4b1cmi4XfXMYuTpZKfGfk3fqiLDv58GQ8Ud9Ej7xoBpzUp1bRFIhV1Fd7GXB195bwBHyT1ya
	nQ8GRXCeWofnDGbpn7q6DuykatGWt2NzJvJSMz0a+2vpGcVnpIL6TCHoQD5k/lDlPcIHstLXWoI
	ZHgjdWuCmdkPeJ3O7i0GNT0+eqVHWb6L1zrNNoIits1tvkvjjcY3CRTFM/H6L2Qcotx/s8AhTOT
	oYyI2t+BoIdPUrvn/W2AvB84UDlO8Fa7yb2BwjN5AHn/29kFvlkHQl6aqqhpzkWZHI1mJX+F7Yf
	qfnwz7bXq0pXPpVu0f1tD6vDhklxJOMTvWXZ1y1h8woTElppAw==
X-Received: by 2002:a05:6000:2308:b0:49b:587:121a with SMTP id ffacd0b85a97d-4abb36787afmr35853811f8f.16.1795604661226;
        Wed, 25 Nov 2026 03:04:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm34532250f8f.2.2026.11.25.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:04:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/4] usb: typec: qcom-pmic-typec: properly tear down
 port on remove and shutdown
Date: Wed, 25 Nov 2026 12:04:16 +0100
Message-Id: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIALDABmsC/4WNQQ6CMBBFr0Jm7Zi2CRhceQ/DoowDjBGKbSUa0
 rtb8AAuX/5//68Q2AsHOBcreF4kiJsymEMBNNipZ5RbZjDKVFobhdHNQhhpHvFJbsRO3hyQamL
 NVUnlSUF2Z897kNVr8+Pwau9McRvbGoOE6PxnP1701vv3sWhUWFtdmq5WVdfay0Mm693R+R6al
 NIXudmwYs0AAAA=
X-Change-ID: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ly4lxYiWzcIWv4i64fkqCzQ6H3oU2miiVMpCcOlwbe0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBsCyBxKcrONT3jFV5vwlMpMTTlM7pOnwHic/s3NG
 91fJFDiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbAsgAKCRB33NvayMhJ0WVDD/
 49aTLH7ARG56niDsFnj/vO58UDGF0439Geh5J0b5B9Xd3bJa4zIK4ewfpsuOQVuK44ox3DUEXT12Rn
 6BXNLIywiADOi9/S3iRgIL71HqVUvAQ28thNY/qKdDf2RZkmNbq5/hpEvpTwrMcUYF+y7UKm/LGr1J
 PzvO61xke/6H+dHUnZdxB2cg2j9UvpFWOQ3+oPxR9AhYmIxpP4qEH9Ozi9MWzzoFUmHz0ngBasQXaw
 6rjpDX28rz7gu9OAGcUPnS/tyeqAUza0/oBYoE2ZM8WtR63tpEK48fQCpMYmz3/0jRbeFaK4+XljRi
 XXM7wUAkazjR6nehnyR1WuhWfzrnuGyZjSk1Xn74ApfOZDg+Gujj7uvIPUcEJPWcZujJ2TKDjGds/c
 hcKExqBX48HJ5oqNzZRljX+0azKotgo6NpcgjfBvZ7QAdzflKPeU8r/XhAWo7nU7Ljmu5m2b6aJfb/
 OT2fKklf+QIVlXBEIO3KSGZ0oQZP5x6d/tzUbI0N4KwYtEOFIuDnjZcaw9kgm2KLeEkiaoKY+TnAKl
 IfU/uCaHZSZVbvh7oNZWKBPU4F+LRZqa3zvmg3v/8MFh/509cg0dPqEAHmyWxnBNGbI7LznJhe0s3J
 3hWT0YIPjek5Pca73kyscgGdnpUOY7zCVHRmsLTuupvzbiTAVfhitY/ztAaA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The current driver doesn't leave the port in the same
state as found when probing, and leaves the port enabled
on system shutdown.

Loosely depends on [1].

[1] https://lore.kernel.org/all/20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add Fixes and review tags
- Also disable on remove
- New patch: switch to SNK_ONLY before DISABLE when disabling port
- New patch: detach the port on probe
- Link to v1: https://patch.msgid.link/20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org

---
Neil Armstrong (4):
      usb: typec: qcom-pmic-typec: pdphy: disable the PD PHY on stop
      usb: typec: qcom-pmic-typec: detach the port on shutdown
      usb: typec: qcom-pmic-typec: switch to SNK_ONLY before DISABLE when disabling port
      usb: typec: qcom-pmic-typec: detach the port on probe

 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 12 ++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |  1 +
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |  2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 32 ++++++++++++++++++++++
 4 files changed, 46 insertions(+), 1 deletion(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


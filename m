Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960317;
	b=FUK8kcl7NDVADuVqrXrPwMRnO89pO01Q68deIlxoLbNokTPJiMdRVWjzu27Klg96fddR
	 TOmloskTeaziEtxSaEBeWwurAvvDgecCi52p5F2VF2235FoNR5ok+mQCHfxkeDchf4MzE
	 2NkcSjUW1w283NA3N3/h1eEDVkurB9ioeaSNmZzVvIyImUtHADXxHxlHDO/JXXG/lGuWc
	 RXcYIOd+TwjiwVhc4Z8qP332Wi6GxjPXdl0rZRFkCINco/G/N86/qfDLmjT7xJZ6aOLGB
	 yt9EVoTE05ntbF/tadARHx3b0zokcR0c7AipbTuSNLqaRfI/VGWMSsO0nxSXdWFMqCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
	b=CByyrkCKv7LTBf4ksjGwCoEznkYuGop72TzQq3T7pJJD8Jyogj0Yxmabn17Kvxyq171s
	 TlOHtI9ZvLtpP6GVYAmhAkv3i73WXZdTK1ct/H7axl2jQ96VhWOnczvIHEZHwDUufaI0i
	 sx8QjhsI0dTkABOY8rYgm2JenmBJQMBLaAenHQiW6hUGEWlrfLVwsF2ygdJdCQEq+D+Uq
	 p50PN3BZxNnspuESdMzX1iSQD6RSHNNExZUZYw3beB5mH1y41Gg9Ju3XNhi41NZ+qwhQ/
	 O82AsEUWt1phuyn4tVEsIfYSSCMKJM/S2O5/FurtAPNdGjEQamiPZWToFYLimSkIl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6aBLVdw;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96950606A31E
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 20:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96950606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6aBLVdw
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso3486322a12.1
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960315; x=1793565115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
        b=K6aBLVdwCtDvNVXrUDErFoAr+HRy4mh7AvlIq94sT2SQL9nyA0N0K9H5ArPFI4co+s
         Hr62gpQP70mBYNeGejcjmoM+Cfj3qhkDcel7pq7QbZsdI0VbAbD6rDdyyY4kvpsHlHUv
         iyzeHlGZwXYYHFOqfgle5UBdOdTPCbKp7wAxs9Mw3zsMWCfZHMsRvOP2eVfXmTACkLBo
         lYLIOPAIRQABc4UuQ7pnKwWy378A7RpZE6pdLZ7SNuijZrhAmeIIV+RqlgtNgxXrBTlr
         GjuvAgHMD07GeL3Pq8U3S5MLlyf8PMp0+5yvMvFbjZs9lpzvib0qYA9zy8nH4IwyQayl
         RFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960315; x=1793565115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
        b=jPOrWxE3YKSZqqX+URkFRiFA6BCZ26ddfujph1Cs+2OObFbVMVbOKoY1vFjv4G5DIX
         Rc9zTQ9ysNBHPO5shRRZ54ax0Jacp1u7IvZwePf8Hroe3eNfe+iv0YkTcQZuqbJ+KfN5
         Q3PNf0c5Nk5d6Gi50r8R+p/Sar7A2Y4gO7j9CaDq/i5YnfuudjS4QeczOkRhnGL6i1bI
         EzAfcOqjzQg/WmdxFoYQlO6TNu+KtV4Em/i4RUm6Q6jMPGOgiM0voPE7K0RnW8Tq2iAt
         BfATLAP08zgeXemab1xS/A1zAIULkkUsEivldr2MtrEQpBA/65DJJG1CvJFCjFPw+Fo/
         KUiw==
X-Forwarded-Encrypted: i=1; AKwUvBwcxLyva2YHEsvRuK3pGqlfSNQyXN5S4DqZRoo9Bvl+9URfsOPanfJtX+MLu6n+Xy+bQ60Awsm0D2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYQDIO6+jRGWGeP5QieuwOFwdwIO+GGsKjfnaIjsfmvi6noLuo
	XiaHPPcZ2BP/7c5S/J+0s9v69wBlG1MfYVCSF4FVTDE+4bt6YU0HAVRN
X-Gm-Gg: AYBFou2J7SY0bequN9d9PLJOv3RF0f+lTNzDiztIYZnyHchn9pWy1+RFNlxxFYEkFVE
	TST0O2y2So1HmKKW4UBI6wll6Sl8zjE/Cj9zNyw3ubYfTTDaDaOQW+WlE4CCRTU2pom8UkA6jhM
	2v3Z3e0M1lJuDxIZIrFDgHLkEZxnFEw22s81Dgqzl1j/Yydhh0w/X+ki5JngAVk3+cJw4sebbmi
	3Q1mRhyYtdQ5egIUmhobKQXvlzLPU+Bv4dFt0F4Z2jDVV7WnGrxjk1hGCTdazddEXk6ez6Qu75s
	E62eCUwUn98YQbQWdvzMpOa8OImTVcbo0/vZUAgEdmdAF6cQfx3k348a6DUUNKrdVtbHr3/pP6q
	5HiebayWmMfUYJzatoBp012zdrtlHgrDsI9qt3X/TIAPxzjCmnjUWwpRN2rVxmgvnxdwpsi/y1Y
	lcNt28es38zXJTZycHnGw9sAQjc9HviNrkHPfDtLpOvpcVPYg4pVGXzLqCCK3rUO7JxQaulfnp/
	qQu4gwVKN9zvN06w8DEpk+3KXIIHwK8JX6rLWsr307PeOMF6P1e8uY0rqZHLh+oMbyRBgoldVqT
	lB+sMA9cq/rwSDMAhKxbpjims//S1h0hfTbB9L5r32IQzkqk3gEcYdJFgKUbemYRq9ax9HFOgB9
	rohsvyBpncmCmS3wPmuS2tfwdBfkemKA9w4JQJ0odr6oA
X-Received: by 2002:aa7:d286:0:b0:6b3:8018:7643 with SMTP id 4fb4d7f45d1cf-6b44300a8d3mr4496308a12.45.1792960314732;
        Sun, 25 Oct 2026 13:31:54 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm2802175a12.11.2026.10.25.13.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:31:54 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] usb: typec: tcpm: qcom: fix connector fwnode_handle leak in qcom_pmic_typec_port_probe()
Date: Sun, 25 Oct 2026 22:31:51 +0200
Message-ID: <20261025203151.455062-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

In qcom_pmic_typec_port_probe(), device_get_named_child_node(dev,
"connector") acquires a reference to the connector fwnode_handle to pass
to_of_node(connector) to devm_of_regulator_get_optional(), but never
releases the reference.

Call fwnode_handle_put(connector) immediately after
devm_of_regulator_get_optional() to fix the leak.

Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1..b89495315 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -728,6 +728,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
 								   to_of_node(connector),
 								   "vbus");
+	fwnode_handle_put(connector);
 	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
 		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
-- 
2.56.0

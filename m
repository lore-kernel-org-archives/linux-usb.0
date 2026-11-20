Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168760;
	b=S7RSxgz2PkHHeI99swo6sYWe1GnFxpctNDNColFtzL409Zy/PsFurmvEaHIfgwRgap5t
	 QTmcc66mIgPTX5mvqR5LVulyHPGz6Fush91t/yPd8G+FC+ya0eBLGfTa0xtlnz2aoWJD7
	 uXXy1wUbeYNd+Uxg36cgZX4gN4AkeLy+wEp45/H9jlvWF+hmVFXVyV1owg7yk5HfxPIVp
	 GQHBsySP0CD2O904aD7rYKx3z/wXeeXvKiwb0wRMKlRfKnZYvw4VLw5UutDoWZHzq60Im
	 gldno1DAhn8a5f2u3sXJjvxq/fpiuOyzP38OibT0njrxh0TnrspTsZGwo6e5l7Nb35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=JZ9y+8qFEJeDoKMfWTI3KMep0JK58rGlTaixHi1Br94=;
	b=C6vWgbjAdccyuiLu1HUi4S8SMbEypkbcXcD5UoGlLZDOPnC1ozTjgOufRv6nF+2g8pJ1
	 dVUD/LW3Psl0p8+K/BvjQ/HuR11pNjucnHqOdhwLYiaXhYsNpHpUQTjULrVOruEOkVyaF
	 idrkjyFWY2raKQ/5wG3hrXahDnpjPKZnPORVrj6Htj0vPbqUzV+s4wHJXQZZyE8lLiFgK
	 yRxQeqZRFRnneF4Gl20R09BT3jxW5EM4rM/9+BDSpFBfsM7ASmWTtzjk1OBRYoeqi+qOS
	 +/iJn3kOYZlithikoEXWVm8nTcIsZU8AIwSOl9/4Bv37wxYM3IkusImCQznTsmCdlKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yxCWj6HQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C6260A2600
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C6260A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yxCWj6HQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4558295e9.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168758; x=1795773558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZ9y+8qFEJeDoKMfWTI3KMep0JK58rGlTaixHi1Br94=;
        b=yxCWj6HQLuib83nUfyoSm42QTzQBMKso0iao7cBtg6W8R/Qdn2ID4NiLWz4RKnHEfN
         w6RP7mEmaQUbs8fR4m7ka3CIsgXS+u717/ooGoLJqVPmb1d/4g+HUTmSz6/c02W94VP9
         GZuN9g/dUCNIZAvizBYLbD4Z9RHINdJ9cO9qzVoRL5MmGerDmoaIWZOshg+8pMbUgOVl
         JG6OZ5+L6KigR8THkXqqIMA+nbQkzV756bhbtoghvMh1h/Up793LrJ6khy51YbiPere5
         lZ6GElwUPUrtdRDKVAtk2nrUdHufvilSRrSzgff/tPN6yfllS7x0N/5/rdr7sf306xS0
         eCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168758; x=1795773558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JZ9y+8qFEJeDoKMfWTI3KMep0JK58rGlTaixHi1Br94=;
        b=mfl2NmLjecTlknauIewleMHzFmsXKLS0U0jBEM7f7Qcs+i7wNCVhKk08BQp0PmCUiR
         q6YDZwjUUEEAjisM82uHfUR/IcDhf422EdKWUqguXCxNA0B+UXE9nnF6BwXnwRZlg34i
         E2imwpyq8ayvSeOBpILNLjw6VV7m/n8VW6r9unasDBs4J55Sbe/mcB5x/dnaAKjQS64/
         YtVtUNZmZVoQNJD2MjTiEKAk9/o6EpZb5LkNdloRcbmrJJMfwywiLWq1J/4UeQ8z7XJT
         UIk+atRNHYU/dW76SRb1IevQgYquCZS8LLl69Vn9cf6v7vwo79rbAUt0+VST1tMhEVub
         mYwg==
X-Forwarded-Encrypted: i=1; AL+hErHc/n7ILk8jIdcPVV6sRNwIPrzNe9Ni5ZihzGaZM8+JH/nddSMsdguehvsxIxE8s13KP0zSMJiBem4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y5wKaKJ+R0V14J4NY9kNRjYUoZN35tq+yG5m4HqVxGP+595xP
	10us7XGuYxBdtmA4B8Rf9/m8Tncg0qPC+grtM0WgiL4/wxgSe2EjDOOUPpeNkng0vgw=
X-Gm-Gg: AYBFou0KSYUJyg3acaz90g1W4SgY3yimeAwZ/m/SdDUWwHhV3O5T5nYfYhOx5/kQ5zT
	tEJlwZbki+lSDYn8ieuxCv6eIJsrqug2GESxGLIFED933DGvO9jAd4AXlBDzTri6UzPw1r61mRN
	JPabCb7OKuBQUxAaUOIOrWkb21zTWwuo8lbjLHLDjTL6aGclDrKMqh94IN7REuKf0MPUtQMDjtT
	meOg1nKvt+1+nnL9hgz0qfCN2tT+oAFDhk+FtTg4wCEHwfcY48jlMQWAmXe7jYpvaU9fYGQfMpv
	F6V9T/VLgg1nKSSNJar4n7Ws9s1HjCSSnrxac8fqs7PmGm5lD2RgfaDfF2PwUfkwXkphYY2Wu9R
	h9RjL8Ti3ARaSseogQhLDGWEVIalrEXiikJQGoOLBVQYH1rsQoAYQu1pm6WSmn8tc+BGygdFfuX
	ik1VVxMBvUQp0EGBN2NiPs3hdhWbY8lXe+kSv7Kg7gU0hZObUIxuCeLzKtgl10mD9RUwdpCHn5n
	Sy9xQuF3hnjX0sAxje8GeluqQg6fXarsj47ni8UXOfx+Q53m8mfaS25+9u4yDLI/0J5AdApLLF9
	aLPxwKlL9j5pKbgu01YapXrBsxdvYODhOe15hkllKLK4XDxVOOM=
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr40638855e9.10.1795168758061;
        Fri, 20 Nov 2026 01:59:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm70741515e9.5.2026.11.20.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:59:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Nov 2026 10:59:14 +0100
Subject: [PATCH 2/2] usb: typec: qcom-pmic-typec: detach the port on
 shutdown
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
Message-Id: <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3538;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uiR30donsjJqsFupuU8KKNCD3mpwbnJ2eBvk6K7iBTg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABnzccTF9BENQWPJGmwnVwxrctQe0NEPbyWDc+WV
 ezWxqmqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZ8wAKCRB33NvayMhJ0f58D/
 49O4NnMp/STO+3v2mFY8EfgLSf8UHQ5CoLYpQ5u0HWpy4svS8X6udDBSh6Q0UNEeOFo2URHY4OSaAt
 mk9YZzAEECEYS5w4DzT0ksFSXrjLWkFddVlBZZKwYzeYwDAVF9+UXIdCPFO6CRcOf1jhNM7TO8y342
 J5KknRD8yV5NecgPr9p4iU44jADiwUTPBp4DKDx1Fy55VXqsoqS0TZMPjpY2OVSMSF2bWq04xJPwp9
 P59cM7BMevkBsjzqeapxVVMffq2kS8Jxv2QUztvE7WPpcLZAZjP0ybGaUBP9jsR5uoGOiYSh1x7XHU
 wLUXdCG0sim/wVsRzMB9syn38rpcvKo3l4qVLn4Gs+k24zrK4GllHoM+fYzoq3uB5af8Jt6tVAywiS
 lEQwpujMj8Oh373M+Tkc2R82mtwhoEuS/qGed4EyQii8RhVxZKacFyZ9+GqAcdrxmsHrOqd9t0Vk1g
 gbtTU4lDO4Z7ikfY9W4rTUB3du6Z5uME27H45zCpkQPNUUwWUXqjeTB9s+m6kb1IzlQx6frc+8ISLm
 EU3CWEeT6QMFDTitkCvRZJlC9BJfbsB8ztl+ABdGygVC3iTpVTVWcekaMG2eHQ0gZIU+wmVh/OfUF/
 5iAniAjEPz+NeaDywdpbijdfAi55/juHxmGxRE4BtV+B7mCiRf9NNpPWGUGQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On reboot or power off the port is left as is: a source partner keeps
the negotiated contract, possibly above 5V, and a sink partner stays
powered by the OTG boost while nothing services the port anymore.

Add a shutdown callback stopping the port and the PD PHY, unregistering
the TCPM port, which turns VBUS and VCONN off, and finally disabling the
Type-C block so the partner sees a detach.

Assisted-by: LLM
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 11 +++++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 58d1e6aae637..8169db478b8a 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -134,6 +134,16 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
 	fwnode_handle_put(tcpm->tcpc.fwnode);
 }
 
+static void qcom_pmic_typec_shutdown(struct platform_device *pdev)
+{
+	struct pmic_typec *tcpm = platform_get_drvdata(pdev);
+
+	tcpm->pdphy_stop(tcpm);
+	tcpm->port_stop(tcpm);
+	tcpm_unregister_port(tcpm->tcpm_port);
+	tcpm->port_disable(tcpm);
+}
+
 static const struct pmic_typec_resources pm8150b_typec_res = {
 	.pdphy_res = &pm8150b_pdphy_res,
 	.port_res = &pm8150b_port_res,
@@ -158,6 +168,7 @@ static struct platform_driver qcom_pmic_typec_driver = {
 	},
 	.probe = qcom_pmic_typec_probe,
 	.remove = qcom_pmic_typec_remove,
+	.shutdown = qcom_pmic_typec_shutdown,
 };
 
 module_platform_driver(qcom_pmic_typec_driver);
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
index 3c75820c9187..0818582fe850 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
@@ -20,6 +20,7 @@ struct pmic_typec {
 	int (*port_start)(struct pmic_typec *tcpm,
 			  struct tcpm_port *tcpm_port);
 	void (*port_stop)(struct pmic_typec *tcpm);
+	void (*port_disable)(struct pmic_typec *tcpm);
 };
 
 #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index b2ad31e85b5e..4dc302d732e8 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -700,6 +700,16 @@ static void qcom_pmic_typec_port_stop(struct pmic_typec *tcpm)
 	disable_delayed_work_sync(&pmic_typec_port->cc_debounce_dwork);
 }
 
+static void qcom_pmic_typec_port_disable(struct pmic_typec *tcpm)
+{
+	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
+
+	/* Present neither Rp nor Rd, so a connected partner detects a detach */
+	regmap_write(pmic_typec_port->regmap,
+		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
+		     TYPEC_DISABLE_CMD);
+}
+
 int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 			       struct pmic_typec *tcpm,
 			       const struct pmic_typec_port_resources *res,
@@ -779,6 +789,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 
 	tcpm->port_start = qcom_pmic_typec_port_start;
 	tcpm->port_stop = qcom_pmic_typec_port_stop;
+	tcpm->port_disable = qcom_pmic_typec_port_disable;
 
 	return 0;
 }

-- 
2.34.1


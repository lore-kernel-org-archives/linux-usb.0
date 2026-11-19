Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108139;
	b=YDDZKi6vzBIYhVhzsOPIHLyZsISX6ClPkc2JipZH4JujORK4CCdlPDLcr7m9E8Gxyrvd
	 N69TU/ciuDi6cXgDJf0+HYG2FjksRpY59/igbREzDsxrfBWuejDXGiHYBlPRq52NwG2c1
	 m638Egtg3TNQmMr8qIiyq7fMEj96sFvofZVN/Nu2bV6AmA4EJ3nfoKIypdtfBfjrrS9dB
	 ZlLy8H9P/XbcaCqgYLtPWA5je+C1Vxpu5qGGb9YhqH5p9JgvEh51hkbAqQp1bLhg2j4bm
	 qNo6tkYwqNN5mRNM6w06jHw6myXlXUbzFEAKuT1kJEhg86BF2FtHBSFbEL6WG/AAvOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
	b=Vda/Lx5QJZsZFi9w2zTjcBl5mUV+rvLGvq+T5Hu7k1LUlHH5zczsLZVIDno+mUN4g+Tp
	 aIP9eteewh9M6RZ5RPm/Msf3pahYoNUiz1iqwz1eSp8DREMJlC8s4II0mOiFM45/6Wbd/
	 2aHX0NW+qS2PIoYPT8hmf9S97odyMUQNDPi3ZHNCnshyTMhHiaRVyIG/NHiVIgQT1rjSZ
	 JW8lNjo1KBAgjsdmN8VWIi+vRBkBa29TNPtnqjNFW0WDuWcUfXmbcKsJA/KdeUhVS5Mue
	 W4enSs3AEX36l+ImPKtKVajEYT9cUV7fKQJiNfBXMT3J3jr5prdeHYqaYoEMgrf5Q7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gX2CAPFe;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A513F606A335
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A513F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gX2CAPFe
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383165e9b0fso1983507eec.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108138; x=1795712938; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
        b=gX2CAPFeYUAK79FymZ9jeijW0m0x4R/ythURkmn9dDtfcQWtnX7w7SgSn0VY7MAAea
         z8QQoMlcYCuUnTF6mstqzMIcS/mHLAJrOH5n2DXIioKc/FEe9t+fuje/LIzZs1RSAJgh
         Kb8e9+qtKH+xKYB/yCDe9X0YLkqdu4GQmnv6wD6Qx+CzxpkDmh+J6/vFmivMhFmR0UW2
         HkGzhV8zZ6QUbAHuV62DAtp0xIlO0GGWur4GN5Q9YdO9Xo0H3QYza16u33+E/tECrmw1
         rCzH3UmM/3hHnGQNR5+ALnmAPxU5jxIQpRoYkFxqiJcBNozFHX/IdnDwBu/uzsNSyxVX
         jp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108138; x=1795712938;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
        b=iyr0hGdp9WkfwGHJUB6/CrLUH/iPudsxNlYSb7RaUqy7YDwZjWf3s0LSiic0rGZvCs
         BqLhGvRmtetvxJdDKdxyPmFmvQIrWMH9kcqE7+PjQPnV/7BcI3uZ8gQtTCLrcEmZeSyT
         /YowRtvFTf4H4i5tBMJQScA+tF8PbdVX7yfNgmd0Ryc3MSCJNrvxyaCcV9iQm8y8FhIN
         1ejMq/MJ/33MECWV2baIz9aSVvJ2I9oGyQPvPPwSf3zGfoZjUox8avtERb6DnVvY4znc
         AhB5EtVls/c9o/7qorrCgj5lT7yLzynfH/p2xEapX0MnJR0nxY5B/LRj8dux+NHkjo2d
         irfA==
X-Forwarded-Encrypted: i=1; AL+hErEpzUrsXdbSSzDCHrS2J26lKYgRlBfkCJ6UUoUJRnyyDRLVKZIEFlBpTi+ka5Xt749PjpCJu4fBa5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Eoy67eYKCmDfOOuvOlICup/nvgJ3g0WOOQFK5zGxyH10TbVu
	p7IZhrz8bZbT55bziDQo5/4QBvvbkhgjJXayP71opuZuZW4fRPfdeT3URLbW0gaGlZI1n5cDRNq
	eFqivn1n+KQ==
X-Received: from dldyr22-n2.prod.google.com ([2002:a05:701b:4516:20b0:1a7:58c6:c957])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:290:b0:1b5:25e:958d
 with SMTP id a92af1059eb24-1b5567bb581mr257768c88.5.1795108137553; Thu, 19
 Nov 2026 09:08:57 -0800 (PST)
Date: Thu, 19 Nov 2026 09:08:53 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170853.1529676-1-irogers@google.com>
Subject: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
From: Ian Rogers <irogers@google.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and the
default switch branch jump to 'done:', which logs 'currsrc', 'mode', and
'misc' via dev_dbg() and passes uninitialized 'currsrc' into
rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic debug
is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc()
jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
initialized.

Return early on error paths in both functions instead of jumping to the
post-success dev_dbg() trace.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardware.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index b2ad31e85b5e..a1595b8b53e7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 	ret = regmap_read(pmic_typec_port->regmap,
 			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG, &misc);
 	if (ret)
-		goto done;
+		return ret;
 
 	attached = !!(misc & CC_ATTACHED);
 
-	if (pmic_typec_port->debouncing_cc) {
-		ret = -EBUSY;
-		goto done;
-	}
+	if (pmic_typec_port->debouncing_cc)
+		return -EBUSY;
 
 	*cc1 = TYPEC_CC_OPEN;
 	*cc2 = TYPEC_CC_OPEN;
@@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 				  pmic_typec_port->base + TYPEC_SRC_STATUS_REG,
 				  &val);
 		if (ret)
-			goto done;
+			return ret;
 		switch (val & DETECTED_SRC_TYPE_MASK) {
 		case AUDIO_ACCESS_RA_RA:
 			val = TYPEC_CC_RA;
@@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 				  pmic_typec_port->base + TYPEC_SNK_STATUS_REG,
 				  &val);
 		if (ret)
-			goto done;
+			return ret;
 		switch (val & DETECTED_SNK_TYPE_MASK) {
 		case SNK_RP_STD:
 			val = TYPEC_CC_RP_DEF;
@@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
 			  &misc);
 	if (ret)
-		goto done;
+		goto err_unlock;
 
 	mode = EN_SRC_ONLY;
 
@@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 	default:
 		dev_warn(dev, "unexpected set_cc %d\n", cc);
 		ret = -EINVAL;
-		goto done;
+		goto err_unlock;
 	}
 
 	if (mode == EN_SRC_ONLY) {
@@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 				   pmic_typec_port->base + TYPEC_CURRSRC_CFG_REG,
 				   currsrc);
 		if (ret)
-			goto done;
+			goto err_unlock;
 	}
 
 	pmic_typec_port->cc = cc;
 	qcom_pmic_set_cc_debounce(pmic_typec_port);
-	ret = 0;
-
-done:
 	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
 
 	dev_dbg(dev, "set_cc: currsrc=%x %s mode %s debounce %d attached %d cc=%s\n",
@@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 		pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
 		misc_to_cc(misc));
 
+	return 0;
+
+err_unlock:
+	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
 	return ret;
 }
 
-- 
2.56.1.708.g77570a6a1d-goog


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB474CA266;
	Wed, 13 May 2026 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689436; cv=none; b=Q1vsHFj2P3Ao2/+6Anxf0yP0iN5gHHUqiU8iN22Z0SLBeoVik0gZf6Qh6wZXgBG8Zno3nkQqwNAQQefoa/BvCNe0fxxqQ1Xsnqdf442OtqjsSt9KyPQ9Os59xBDZ8umAeAEOz8lV8lrhq1ArJgRZlOuQRMU+C8Fm/wegGnTpI9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689436; c=relaxed/simple;
	bh=i298VvOeIoBdmUK+OD0uLYAyhZ6aEH4cZba+F0pO2Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNhtI2jGz/3zNjIiaFlL1OVe391RIb2rJlgZzM1PWBZoibB/ZM5JN4wab23XtGv9+E3EdIqZUzGgBR+epJaaJFoBuBBcxE1LEBH978imQMWfyz/ZPSBJ4g8sSACsofIf1nvVXeTdgsXuOU6+x8Aq2ZLTiqHXQG/LypW+yg0sv88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvI/jmFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvI/jmFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D7EC2BCF5;
	Wed, 13 May 2026 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778689436;
	bh=i298VvOeIoBdmUK+OD0uLYAyhZ6aEH4cZba+F0pO2Jk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fvI/jmFNBiomrvWOviBrDu1lddn3/2DayBomD+lzpzO+yHx1cJQNgtU6ReIhtDN1S
	 NjivZbN/xcmTeTR9FU2RYyNtXiZ0Uf5FGqPpFXY6kmkCETBUuzKpSGBdMsZwGTWdyV
	 bDRqnekvFM0MUWwVPLKy5pKF+qbb3tmA8ZAGCx2jgy9PPercwZhQ7fQ7MbTZQdaLhc
	 U2MPw/KrBlaF4Z/EbOWrLP8dU1ZmmaCGqPZFFzWMNiJodjj5xkUPZuPxq1qNlNsIS/
	 IXrP/AC30ZB95KLxfUknIXoACkc4Z/6y9HL4bV+DvoXtQhCpZGVFgSRaQJsgSFrv16
	 IIrj11/xvXi/Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 13 May 2026 18:23:35 +0200
Subject: [PATCH v3 4/4] thunderbolt: Add some more descriptive probe error
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-topic-usb4_nonpcie_prepwork-v3-4-b87b5e408ac7@oss.qualcomm.com>
References: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
In-Reply-To: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778689422; l=2134;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=pqu2VCWMefuVciX3P7frQNj4MipGgNMMNqP0pkNkivk=;
 b=i0f35biNtskEeG0gWBao486CnObar6Ak77Ys5vZdiIK96KzHHDW/V+1I3tUvQlnwjrejq2Dy7
 8jVCLsIhrtBBaJLGXiKmRooTC7tIJ/Gh2PmYqs2i2jECXmit2BFKFxM
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently there's a lot of silent error-return paths in various places
where nhi_probe() can fail. Sprinkle some prints to make it clearer
where the problem is.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 4 ++--
 drivers/thunderbolt/tb.c  | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 2a8d1b3716c0..2491e08bbd24 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1190,7 +1190,7 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
 		if (res)
-			return res;
+			return dev_err_probe(dev, res, "NHI specific init failed\n");
 	}
 
 	tb = nhi_select_cm(nhi);
@@ -1211,7 +1211,7 @@ int nhi_probe(struct tb_nhi *nhi)
 		tb_domain_put(tb);
 		wait_for_completion(&nhi->domain_released);
 		nhi_shutdown(nhi);
-		return res;
+		return dev_err_probe(dev, res, "failed to add domain\n");
 	}
 	dev_set_drvdata(dev, tb);
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index e09259b35d40..4fd052e6552e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2997,7 +2997,8 @@ static int tb_start(struct tb *tb, bool reset)
 
 	tb->root_switch = tb_switch_alloc(tb, &tb->dev, 0);
 	if (IS_ERR(tb->root_switch))
-		return PTR_ERR(tb->root_switch);
+		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
+				     "failed to allocate host router\n");
 
 	/*
 	 * ICM firmware upgrade needs running firmware and in native
@@ -3014,14 +3015,14 @@ static int tb_start(struct tb *tb, bool reset)
 	ret = tb_switch_configure(tb->root_switch);
 	if (ret) {
 		tb_switch_put(tb->root_switch);
-		return ret;
+		return dev_err_probe(tb->nhi->dev, ret, "failed to configure host router\n");
 	}
 
 	/* Announce the switch to the world */
 	ret = tb_switch_add(tb->root_switch);
 	if (ret) {
 		tb_switch_put(tb->root_switch);
-		return ret;
+		return dev_err_probe(tb->nhi->dev, ret, "failed to add host router\n");
 	}
 
 	/*

-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095729;
	b=HbjeHlO6dq130OFdEmJGY00EWMCw933BEpbe85Owim7SOwNyWicwk4r2YdXficJHp6Ro
	 E2iCvfRkI/xpOz7p1wRv37aV3fMAB4BGL7BUrSiBKIme/dNaO0mmARCaikQt8xQvqyDxN
	 61eyu+Ar8+hJKKcNhcw6fOMdjkpfg/FD2V1fjeewfO6oJy6G4aDT6yB3ZIaUzZLwQqVNm
	 S0t0LPatn0vkyYn7QPYwgFQvNf8uQng3QMXoi76NsQ3j8Ns/tZj9FOfkBmHq5g8tjtfMI
	 lpRM/pvxESOi1CG/wyqfEWi3Bj8xfFhjvKuOJE4Gt0HmAbOeULkIT+RhbarhNWeODPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095729;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=o7r3ZVjdaaHSXOLU8RPvhLIxxKrBAHiA5Kh6IGyVjpo=;
	b=FApS4vnqBwi2mkVO+ahiY4hOvIzhblE1PbkdbXp+AJzIZXjzQPksq1IGrx2nRCeR2nsH
	 Qu9q2fBHRXvpdZBi9VOTLmdMaJvF2c45uK8zNlfcnhIgfKQ7YgZTv2CpVhDEMDSGazUge
	 /pv8GqtIe20bbdaNDSer7Uy2SOqFHGQDpIdZSF4gEuENyqjBClZBEzIYznUTzFf/EGldD
	 gNUya8owalB61xStaCC4ibyWq0wHF0MyKGM//bF4Pfex2i64TYc8QZ+RDSNEIE9KK5+yb
	 S11Uh3+zLfqfSjRoSk75VFRslib1h/5Nvx+wfaZir6tcH0jauS+1pkPpvR6l6zhCqeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="xeT/TWmF";
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D0606A326;
	Thu, 19 Nov 2026 13:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E0D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xeT/TWmF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795095724;
	bh=o7r3ZVjdaaHSXOLU8RPvhLIxxKrBAHiA5Kh6IGyVjpo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=xeT/TWmFr5Q8zRsc768PnyNDnf/fV8coFMeigU3XyXsKR3jNoHSW9SORsX6cha1hR
	 iyW8hWoczaPsyE5wAvRJ1lY9sO9NYvQAweqv7l+thJZjZLEJk8ivoNxcSLwfMvh5st
	 hzcrldfdGmVV+zWoNnHk1yuQFuCoRemKJtKZeh6c=
X-QQ-mid: zesmtpgz7t1795095723tdec0d11a
X-QQ-Originating-IP: vSWV7FEtXe5qcnty5tw0a24FtQdR8Q47PyboIQGlWSo=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 21:42:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3058943775656225345
EX-QQ-RecipientCnt: 15
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Thu, 19 Nov 2026 21:41:53 +0800
Subject: [PATCH v6 4/5] usb: chipidea: usb2: add optional reset support
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
Message-Id: <20261119-b4-spacemit-k1-usb2-v6-4-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795095710; l=1684;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=nFOZIU/Ylf8z5EmSV9gLS22+A/wBYB8yjoD+NE2hD6w=;
 b=F5QHcItps7+ypMj1XfPz3HsQXkOXDIeZD3310D0W3K10ktsfWRDPb/tNSzVC8PJ2m1vWXzW9l
 aKQrA+tf2/qCFq4VtiZIdKBf8Y4KO3grs+AgOQYjpPU2QP1nYS6ylRm
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Of9G/swEJZ1onef1bp9GF3LjLCi8A1Qef8yLOCrllRbjKsg0Zbqy+Y4F
	xNeahQrlyeLdiQ98eK344aVOJ/JqYlVvzpHvSTdVSm5bVlJaXQiB6+NVDjBr/5e2Mnu7u5n
	nqVSLMaZKCg+EclQVUcXH+W1CI8FZQAKmpQFghhyEGMGjkWAUeKc579UTk4N7tNcoNQJ/Vs
	0oOusk7JXTTeiNULFXNxhRyZpLH40rJAho6Gej6h996ABp90b0hTS0zcC1F7EhXfbma48zP
	4kkjHZ8B7i/754J27IF68K28Mreyc1dGDppBSdEZvv9WBT65/KNzTorByGHDLbZFr8se9fi
	GgQ5wstHoHmaTQ/ecMWBJ/95z1XLbqj2kOWq0QpTEcycP2plccHppxFIQpnwjq3rGtlHld2
	kdStHofcjw9292bRGjjn4AUuG5AMhP/2HvdnuzYwstdvEPFcn6P8AkahYsMGdXLFxRTVFKp
	4ESrG/nRllTRtthoL/q9FXIyDwf/zW0eFPSAdlmU/4/Ub6t7hq27c6NhWpxeuSMZLGdpYJh
	P63V1GsE4wNoYOiHTzSclovP7Te004aMbebRLDT6i4DpM8Zd4A/kadQiv1mGR59d45tw4se
	THs1mQ8w3kseE2RTZRtbhJMVwGMpzC2BSbG+BnkVw/plOrjzkYiwrxod+wFajfNdd9pFqiN
	I4xDXM3sq7UE6j3auwyiuVtOIZPlh6DrcFscVKnNl9pWeRWwuppRFravltjRUUgHAbFFpiW
	htxbjsaTQROWLtXtyZvdRlJwHAlBFY5LrSzV25+i6hc8rxAVtCuauTKRHv2zudibE7zL+yC
	M7lXs2pwAoe293MomDjn90rMbsvXwqCWuKxs7t06erLI4YYikcmexCrdylUqD2e7yd/K7O/
	kOBSd+bDhF9EuYtdh2uL/V1wFE4FcaJnwIil9x+mcTTM4ot0vS0SvbV5Gfpxjd99hFoLg4s
	SBoJu80D0fBa1BSUOe1dDeK8xZUZdEa5PDPeNGcDgoxktSCqoaUZWLlI93dGROyDK6DJ1W4
	Cw+gprx1hWek3kUJKaBW/1ZZ8fpAvWd0NAXVR+vLdHkXb1U/ipd+/9BfwlTRWNx0ZkG8XeE
	hhaYcNF861xyB5pbq35LbKMUn4DIYkRUA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
compatibility, add optional reset support.

Tested-by: Ze Huang <huang.ze@linux.dev>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 264546247a08..226e3cab6ca0 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -12,6 +12,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset.h>
 #include <linux/usb/chipidea.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/ulpi.h>
@@ -48,6 +49,7 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 	struct ci_hdrc_platform_data *ci_pdata = dev_get_platdata(dev);
 	const struct ci_hdrc_platform_data *data;
 	struct clk *clk;
+	struct reset_control *reset;
 	int ret;
 
 	if (!ci_pdata) {
@@ -67,6 +69,11 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(clk),
 				     "failed to get or enable the clock\n");
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get or deassert the reset control\n");
+
 	ci_pdata->name = dev_name(dev);
 
 	ci_pdev = ci_hdrc_add_device(dev, pdev->resource,

-- 
2.34.1


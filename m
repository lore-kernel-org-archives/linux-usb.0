Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550531;
	b=HF0fXMgSCnltyyIzSJDozqcIByC+q3mlEA+q6KNMV1xBq4HvXoBN5sPjPSWH4QqpKLTw
	 YqQsSNgPKKpEbT8Lw7WWcQSSLt5aYpG7lHtvsTlVUuty+5acF8kmByGc08pksEreoZMCm
	 cjF4MS4dPx+4Uqhr3hIc/5W2KF/pmDPvqsQUMFhufyeVxDL54ETHcbZr06DCwsWI9v3yC
	 B4cBUCKpY6kvbl29ib4iv9LxVJIxeOqTGQJLK5IEXIKx83TSur836wSbU8OKtoTSb4MNE
	 J11EBRfOfxaxW+7h6nkBYujhHPkz+9YMHu4nsCdhNvoUg5wB5pNELagzMSYIa7D6GTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
	b=Z52JdowPqn8SAga7az7bEQ/xkGhCBI1JABNhAqhtfJNzB6f1s7xKGa9rz4I+HF/yFyOQ
	 ztaMqvOlSonF5kWgHacFbQB/PerX/cSSP8nrW8YpdeeC4QVGRoIYFsqvZow4U+gH25sDN
	 tsw7b0ht8rCBl6eGCXdxTjqWZxHMgTXQ4PYd0jopPzEdPZC4csVWX4S/MMD6Poky0C9OK
	 lPmwbMJ+ud+nIsClE4IeZQ4soXngCxRbz2sVWVEwzP9fsqjUqUzlj9cbyQR8Kqe6nHV1F
	 Xmj90cAT65PhmsvEnjdH7tu4RBRXXvsXXIa2RCyac48ZPKUh+Kjdu/W8myrhtwGpFmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ijRyg/7u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QI6GxiBz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0C606A33D
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F0C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijRyg/7u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QI6GxiBz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJKWGu2855019
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=; b=ijRyg/7uiy425nk6
	xxkriXE7jaF7PKGKzLo8R5zD/gKCqdT8L9upLh5FG/xciI+yp6LVEYYjBjMtg50p
	3NMH65vBbw8802dNc7KEML3DV1WVnlzqR+7nsy5J3EccB5T1L4sOxI01vptmiSep
	emKrQC+RgJ8LqFOg3uXB1rNrOWKulpjXyjnovyXYVFarQ8jSAa0/9/Zn+NBKSzuo
	+UxFZ5/gRNKwRQqqOOhRJKKieaQa7g3ikkQE7sJfsScjhmD65/vVODmVvcR4mp3o
	pnUmCAtor+bmy15nsqRXPJ6gNK6e8HhaVI06bXp4uO+wPtfoNfCGDyazclWVKymu
	kQ/6+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf858u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:02:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c4997063aso14484811cf.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550530; x=1796155330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=QI6GxiBzPixld/3+5TVJiOtPAd9EANPRLK5CvPjIcLWo7AEeqcV4pDS8v8c6tHlrfi
         dgFQKrFIC5bW9RgGut1+G7gdTUF6wGkZMKWuGZI+Xn4mMEvaAeztAFqBpJ/gB7A01mbi
         7Q2OHYZBrD/ibRPfA6kC3PdqC/QxD7pbdfF8D62XTfI60oAqKHxcQPnIA8GnY1QZs4Z+
         HUbCDLP1gBCimn+BQ1Oh32+wRGi7n188C+8ONt82E6Ua4W11j9+i/hfJMELCZLXGq/Fg
         XeyccX5a3Go+5ElQFWAkY2Yq9C/YGr3tj4W7WGRP4gJNOUmeARF/Zi8bhjj/szTgY4K7
         lVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550530; x=1796155330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJfJUHH9e+1diTv6/vuCeW7kuhaG0Mf+QFLudhQqmoU=;
        b=jUiqpU6Wqi49ljY/PnD52sAZvht4qgcRBF+2GFZbBhzgMRKl7zABq7CeTSY2lqyNEy
         uHSgnN86KMExN7gLWhI75EjxFnN9fvxffeGB9gQMoticZx6cPgBqGG64WjLRaktnwIII
         xGrOEvQhYiS67um6ZqnSyojQGcwz1pS06cVBJXcwIV0JW5AbilZ6MT37ob+2T2gm5tHo
         ir412SxSQUsqk64qvO81LXrrBW9PWcu05GKWRcbISoffxddjxIa7IF6lEcX46CUa1fa2
         MZqiJr9bB5MjRBEoCcAzcraxNjnlX7QW4KtpL34qA6hJCAl1u79RWIrs69ZaBySC0Voi
         tXPw==
X-Forwarded-Encrypted: i=1; AL+hErHO/iTBK1+wv9OVowzhOdALTynWaOx0JHFH+Pb90Ga6TZb4ZCgl4ROvfFjH1a1t/rg5O0TDMLtPebk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BebY/1t2K0BUxvMP1c1X9cdPfxIm98i67FNF1RCqq/rn7Y+Xp
	1q3D9ZqA9XagS2hqQ0YzZFq6uLnBB/IjCXMvRnNby8oRKOmnCneDfb73r75SrZkxQ/Xxlaa/sV9
	zdw8oSszkB79AV7Bd2sV6K4PXKHNyMq4unLUHd5LCTpMTouCJWTVidX6oFz6rdtg=
X-Gm-Gg: AZFdTZeVx3vkgKwbPl3TF4vbvfOupR0a9gBznHiwzh68Kd0McOYO909JAjNoimclg06
	VVOC1TjT3Hi0TTpSnXMLP6+w2/QIS8QBMx4uqOS8F7B3exrRMn1eYT/jbf9fDgyqoEY80bDMuNf
	2hsntJVFk0WOECFeyM5vOlrfuBBoqCkLWY9i8rs8IAXaqocP6q1No6DbOhGVz/TA6mQ+zGXIKaQ
	dycR+Ty4cPJa4znTNgexYO3ivi48/8yr6+b9gJ21ShGB30WB8Yr/VXnkZZP/STevtlWCnd3uZi3
	0VaWnt/qgqMGoOeCKwtN3dhenCWIG4BJ4Ps0ViU4vn0gnUA/QCSpHyjWzxdQHtVbSuEF5y2iwNG
	LjVnfdW+svijSX52DVF/CeAvmauL6psuDW8e9DoBTHfMOv0J17JRFjLzhr838NqdTFJLXs8jnLM
	bgX+02p8E=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492985585a.2.1795550528207;
        Tue, 24 Nov 2026 12:02:08 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr2492979185a.2.1795550527583;
        Tue, 24 Nov 2026 12:02:07 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:06 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:38 +0100
Subject: [PATCH RFC DNM 09/15] thunderbolt: nhi: Resume the domain if the
 NHI suspend op fails
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-9-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2000;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=VkyXd0QiiEQncfW+Bjx7hTZQ7/bCBvoRe1dG6P5u4+g=;
 b=w4xeWydBj5adKKUqB+y+5tcwfjeukaRXas/yGtt4/eWlBLJ0+XyjsG0TEgr+nRQgr/2bi+iTD
 lWRKVcz/oOXDJ7Uyl0lDZjLWx4f3oivC7cVJnV6F8m77tjvMrYmjYIe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXy9gVjpz1DXsK
 UqmseFFoz7hFElX+UNYoacKmuAsSIvkhSFfbcnBpgxRjnexHDuQooalf2m3h443JaYzzCiOe1u7
 kReO2kLXAOFFL3M3J4tukU3W1iPaYIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXyUwRR4g/WjTb
 Fs6hK/xyodCq2ffALofl2tzDPOcHilww38LZU7EGXyYcLoMqnfPWCScD+h+l/CHx35ErHOcyJbZ
 LbMG2vcPKf/oAhpEfb9UVQuOlDBPLVASjOBT1wS/9YAYS+AEaVfN9h9Tos+Yb1xyAaQxTPCTUau
 vUzKCmjxvlS5kgbPCp3/NujiSdqgP8OsHxdjRUYDQbveKw6tGK1CdBhIMZrpCfLudfzT4hcukIC
 MCa7Xh+Mge66ZCzuM3rqpLXVCoVE6MZcv+jly+8747Spi+HheoO8nKlAIB9HFlwW2FMkjME5r0t
 IqFtXOT22uMDRwLn5hHFS/FGaPsEFP/zsuBXDItguzJWHyJ7ow/2lUc2XlS0/OU5ljRI43Uhjth
 6tSVo8Et5yhQII4uIU1ZLTnHhN3yR/Nq+YynCyMg/espxcEX1DLHeDIJ3ZsSCuQdneeHgH+wqRJ
 7D6I6NU3z6YuZQsOEyQ==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b05ed42 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=kCfvZJGldO2mi53t-5YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qAe8Nay5mSJnzL-Ixngfm9mwD51297jv
X-Proofpoint-ORIG-GUID: qAe8Nay5mSJnzL-Ixngfm9mwD51297jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

nhi_suspend_noirq() and nhi_runtime_suspend() suspend the domain first
and then call the NHI specific suspend op. If that op fails, the error
is returned with the domain still suspended. The control channel is
stopped and the switches are marked as suspended, but the PM core
treats the device as active: it does not call resume_noirq for a device
whose suspend_noirq failed, nor runtime_resume after a failed
runtime_suspend. Nothing ever resumes the domain. Hotplug and config
space accesses stop working, and the next runtime suspend attempt
suspends an already suspended domain.

This happens on Qualcomm USB4 routers whenever the router firmware does
not acknowledge the sleep request in time. The op then returns -EBUSY
with the router still up.

Resume the domain before returning the error.
---
 drivers/thunderbolt/nhi.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index bcc2b959e3b1a6b014c13a4938ed6f68cb0d0fd8..e2578740d569a7ee1d5ab22e8effc153cb7d4632 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1177,8 +1177,15 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 
 	if (nhi->ops->suspend_noirq) {
 		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call resume_noirq for a
+			 * device whose suspend_noirq failed, so resume
+			 * the domain here.
+			 */
+			tb_domain_resume_noirq(tb);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -1281,8 +1288,14 @@ static int nhi_runtime_suspend(struct device *dev)
 
 	if (nhi->ops->runtime_suspend) {
 		ret = nhi->ops->runtime_suspend(tb->nhi);
-		if (ret)
+		if (ret) {
+			/*
+			 * The PM core does not call runtime_resume after a
+			 * failed runtime_suspend, so resume the domain here.
+			 */
+			tb_domain_runtime_resume(tb);
 			return ret;
+		}
 	}
 	return 0;
 }

-- 
2.55.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF1A4F0537
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717725; cv=none; b=h7puuSKMk1JTvlkkD0gmubfx5SR93pqWq6wBy0MIc892fuZX03LSPXWWlkmTVIWN67jr9uC0Xig/JORFMOvl/U55DGDl226EkRb6/WdgIE7GjJWilpHBF+ae4qUhw4eLjD9ato/3Zq/YYxHWTqHM7nPIu9tfWKFrZ0tx4Tesy5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717725; c=relaxed/simple;
	bh=CPcxz2/VOvWAWtViNoiWgwxMugTpbWTs7rbDXCSIDRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pyFci7yPTNOcst1TXyItVsYsZH6arhW8jrb5/V8CNp/ldFWwVhn7LtAbyqTFpgADeFDvXsSaB6udH78vfCbGAQkL4aXcUuyCPqWK+jEUC92/ZypWjkvWfPNPfuoL31+bnY4IGPFhrsUyi8u4GuPh9dO7ZZQPpMIL8IgEisdxc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbbI+5pU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyA7T/pH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbbI+5pU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyA7T/pH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THclsR3936596
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5t8ikYnzF7L
	NMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=; b=EbbI+5pUuEYeEWFzQkLfdOqBb9r
	57jd+IWs2QjkTmw89kSwc+aGvBUmg63mI3/nUsicr7xUzrn30xBOhegxH5CaPcRJ
	keirJkLIsYhl5B9OEOMVTKBSPnp0LtKWbGwyKaL5XY4ybUE5JjFkZjRaXE9zagrX
	TP55GFzrKmNxfrg232QezIFFBHybpYij3zv4pz5eLwqNAhMGQLErXH+WD4QOS6mU
	+0gQC0JLBH4ae6cNYjhjyXL6LJ1lcy6nr+J1Ug6BA3JGazLcDqD2D+eUJhoP875A
	2LRSgkblbFgPW4xA5vTwc0+1awhx3NOC0xa8XFTGdGyUZcMABBDLgLglL5w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1jucj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so9274197eec.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717722; x=1791322522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=DyA7T/pHueczU4xlfV2Vw9tU7JcdgaiCn069od89nebJEtC9V2uGUEhdpCnJLWnEup
         d0DkP3XgNEKFPLjAqC4I+S+ad4rl92R8xJqFCk8ehqTnP5TC687OVM0wtwjACS/r5gZj
         0OqkqzL4aS4XXM6D9YFb4qe8jQokEJAd+trENttL6jeAkW+WjmUNG3WS0XpsjedV/F0t
         QP5wRH5EXXnhVCnmA9ZQTkAOSU08JdKcyzWEZsLtSplGwvwW6KNpgjVm5i6+OUhMGUnn
         /jdncHECl783OWZEsbG05pp9tkXaHV+5/i0Cjyumakq4e1inf+D5mYNr9OGF0mBK0t4f
         LFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717722; x=1791322522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=w2nuc294LM49NOGBl0MEP10zybTQCFrE6jnNwy9kDhTkoLYBXhiWe+2Vn/KoflpHEi
         CdDZbTiJJ53DBrmqwnoHBTkfelkAiHr93je+qiYNHMOwfz7K97Osc7RFB1cg5hK0CvHA
         vCYvodWFH28V/BLty/rrLdqgMnZj22iH0mUoU9Y+QAkpWDSPf644beWRzuAHwLxyqZPv
         x1ejExS5V+ZXZBt47DYW+aHOJeng7EfuJ0T88Ttt0CDa+xNrSxK3zYS7GuvBQG0RSye9
         LX5IMUDwx9djcpYcZqkgwd33nXCQ0eZQlknkrZcPpeMFdG3UaDcDQBrGb0QuKLsZOYY/
         BXWg==
X-Forwarded-Encrypted: i=1; AKwUvByvCZZgsedVo9drpD+CJA5pFlsnJBHnqqZDb3Btw2mJI62JtBDgaVifMjgpwh6j6PtzJtjdr5KY1Xw=@vger.kernel.org
X-Gm-Message-State: AFuF++mEYG4Z7NjO40pBXml9X7Mcb/roPh17+hE8bMtOHE5s4cQz9+Sk
	N7Zq6DY8NtatpS0vMb9cTTDeuTANGrRW/5OLbhrycLVQJ7m4JuF0YwVAbsPjv2aMQyEZKyeuNp0
	YvjLGIeFCu0BMuVFMh/UwevsKwxdIFZUvrhhOKh9QFCoqi0G1H7l+oB9dlosg0yE=
X-Gm-Gg: AYBFou07/eGpageMTryuEnuLVdaoDeQg19RPJoWzMcTlFFDyLQF0rGfQmkDOH7hsX75
	bhEp/7VfeMfyBwdCWyLx9Ufmd28ffwHSm1wec/Zo8N5JghhmlTAWwazyk8YiK4OqmxyaYar4iJL
	xbrlBpTVQmOVRNGv2uwPpgTqCprlg1Ow2dCKjgm5oScxntN2MTUPyHDI+mpUZK5h0Ek/opXVJfg
	U3fF6CrpVwFu+oREKfGwkvkLvPdsuwk/prxRHH30xMk2nZAoUM6Xs/Y3e1PYz7RKI90hvXyemTt
	FmxyqywqmBzkhtUxsybEJy/dllbfZPhd7dRcteYAO9QTnp1Mx5UCYxsxhUbu83nouXhsY/OT/DQ
	87GKmeF381Yk6Wk/5hWSjn4FUwNawEQ54UlY+WpM1EC+cECfx/cKY
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576249c88.38.1790717722416;
        Tue, 29 Sep 2026 14:35:22 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576206c88.38.1790717721869;
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Tue, 29 Sep 2026 14:35:10 -0700
Message-Id: <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX/UqKkVUI4ID8
 aNKoQ5BPMXr8gPinh65fwebzyck3xEoWRguKJEwLMtwOqe7MSEpxm+Eg3mUQ8S8ZRE07z+US628
 ABa4htPlbBW6p/U2XIAeud8jfe7KSUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX0IELuQB1xl+s
 NrAD428rZI8K8oXBtljVNrsTeg5Y761pV0RONG2b65CgNcvWLbk3PT5jimkreW4jMM4LNsYP5FU
 VGn3El07JOtltqB4Z9lIxS5eQnAwq6OrMa443GMew6pszpgtUvHIpoEx2pT6fTsTQGUNX2QJrYh
 M2FG51dTZ/UCqCGajoOVFGCV7h9ZPPvwGuqsXgKEB8FjAImq+YMH1J4mqTr9n9rDSs59d5XodUr
 CXi0HmPPkr17B2SsdPW7O6y7cRvg6BtvDQLACtXvlCaiDXjoCCRzrVK33S8hGcqeHwVSBR4QkBp
 fYQwgEDH4HlzDAgVewJUnAf/f/D6BtxDIJfB6qD1yNofT53Uu96eB00P2WsP7B4nMFv4lhRNC4V
 cJWEzTJlCa4yV8ycU6jnC18cjp0dk1KQOH9DWrGr9tRbjl6hadmLT0hxIFilYJB7gogddBO8Yq2
 VCCiK9vyQGAUKh2X+NA==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abc2f1b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 6pQ82NRAWWFEPSk52TmZzN62Kt0lIV7J
X-Proofpoint-GUID: 6pQ82NRAWWFEPSk52TmZzN62Kt0lIV7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 48e474bdf818..e227d05cfecd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


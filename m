Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1CA412BFC
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376540; cv=none; b=XMFWJ4Qz2LEWEuAA1NIyzWcx2qwXZUSvPgdw7/Kj386cq4izei5Ny/htOUbXEm2mJkYQbF/pIG9wcr3DcgPrAEJI4QxYi+Mj6odd4axQj6XIr99FlyGfHULTL/cGM0KSg5Ksq4n+OFgMa2mYMkktaj+lqjJ+irgPLostc8HC2sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376540; c=relaxed/simple;
	bh=NB1VGGbjbuOxIk5Mw7HUiu/hvGDkUOwfKdlFHlZ7Ols=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOoz3mBivEW0UBWjm4uAczgRFEsB/77dOtMpDeBu4jTrxfZKheRByOSGG6fPqALyuCfzJzZ7lWT0TgkZThCpcDUn1h/6oavqMGyv1faiaV39czaHvUnr4d3H6LNylSrUNqZXjdkJCXYfGQbLREaYSPFW0YRkS8UX+zWr8BYDKO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1sP4ybl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOGONjvA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1sP4ybl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOGONjvA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWLMW1729090
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxKMXPPwMwKGvDo0ioQdxZL+9a9h+gbyqaNwhVID2zg=; b=B1sP4yblbzOduPve
	iSSvRJzvgNVdCY8JDaqMydOS9IKFXwgyoG1k2rukfNtSnXkRSjpvRFWHb4YFm0sQ
	nWVvlAS8wMC3VuIawDssRKi7FcYM/HsoEQ2/ezyB3YQ4LLDgKNp7ldMeHFAmLLsf
	siNRlYIpLthmjoEjj2NF49ipzInIrG+EztFqnTvfP97cMpZiLrFKLDVecaYTIepb
	9SlTyrUuBxFyXEuYozPqtm4LjoSmQRcYdID1Yd8KsnF+0zsYyk3eRsD+lCQf7W3p
	Ru2BvhQLkv2/RnubtVmdhZce7vUhNN05tKxHxqfk2MZ6N7GO0Pz0KSmRcKUIj16c
	uXoNVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v5a9rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so25601381cf.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376537; x=1786981337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxKMXPPwMwKGvDo0ioQdxZL+9a9h+gbyqaNwhVID2zg=;
        b=jOGONjvAuANZrQpTRf6Iq7RFw3iKLXBdjOsUWDtU1CynMtgB2CSvXWXZVkR0aJhCsV
         3WKWS8PZ9fuMbx+hGyVrrTRCxh+smrZXAufsAsIst3toIWn7fkplU55/aVS+0aMP2Jem
         mjE4Fb8D97DFAcDJYHOxjP2EbYrNFhHt9n0CE3Nbe3Otvgl6VMm0C4pHJx0+iEeRk05O
         0zeqrMP+i8gMpDRGX+8N0L326ZbGb9h3qpEFlV6lqlT00zd9srO8cVnys2lFqilBY2qq
         aBtWSumkBqGxY73k1IbocKW/pxg+SApjgOObWvO5GhJ6UTKHF3OCuOg01y1v0YIq/R/+
         tUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376537; x=1786981337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxKMXPPwMwKGvDo0ioQdxZL+9a9h+gbyqaNwhVID2zg=;
        b=mfkHXU/ByW75XxEaOtQU4Pqoo2ecHfkZpuybQGvcPnlbiyiF9qUvktb3oSziWtXOwW
         ajCebiir0GHYx6BpWTOn/c+RYTLVWHYKvmh2Nxen7jdUTaqH0KnZlAqBVTgiEEPM4jzf
         7wThJf7otOF3OWplBQXqUJNyyssNawwgR1C0yJw/TrA814M8U09H3UDFFix9Hl91Cev0
         65/OBvoIAO4crtJjNxrz+xUH5ogPDWflAQtf5+0jo0iNph79VbR0KnKdtNspsaXe+EN9
         TuRAUHKh1UdThc3Dpn3F+0UKFyMmmW7idL/h0zqE7bVAByfH/lw5F579dZjbzGE/f4GJ
         lBKw==
X-Forwarded-Encrypted: i=1; AHgh+RqpJjw4xa98/Twb0wX71pBAON3Ir0T9MdVZSfngPoSIkw2uLkqqD+IgqKaGIaZVsLG6raayL6zL9f4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxprbVlGAaocYaFnhqfO3ucwqvNaN3TdGoKlZV76PoddBbqN2We
	sIUsPAJFlTS0X3EzAfcOISOQs9liJBA/OqDHIA+/IDh7MMN87+jo+MdTeCgzOMszAYquB86KOXo
	RbrXZqMTSaoXK2aT+JNZiJEOB0iBrz/AtSmymSertM8rzOjB6wmWkJ2uhdF0ApJA=
X-Gm-Gg: AR+sD13E5jOLbwkAZHc7tIj55vHdbq/xO4HmwLkjZ/qFDnw6EWjmRhE4YD4khOmf5q+
	bh+N50a3A1S8fBy2XJ5SEy/LWnXCPwQq3L3V+Kd9sPLuwGrvYBYzQTs400f/PDQMGQ2pzcyVEtA
	xuGCnNOtpE4xkvxd3aWb8lHW2e+Oa/ryBX4R/2H9/VehfJlupRqdPkmjfXC8hEF+dHlItr+MQ+B
	xTnoU5sOpjgMlJcaoKY9/AwyxHTLfuAu3MyqAxl3Qpp+FyANIkOkps8FtcSi325XxpTGCIbAwPl
	eaLtDEsXJf9kzrbiRTLb7EulRPhCzYTr1kaFqIEpdwQ7a655Pj7xOJfePuKNxttbd3I1e08rqS+
	Axp5vK9lEajJEkIp+mgdO7g6Bnz9XvQsO1pSHNRW8X0R0pXcyqaAB7l/0q/rJa3bgIhdjSawMSV
	3Z74cTRY5QEbMq/Q==
X-Received: by 2002:a05:622a:1454:b0:527:f0a:ccbc with SMTP id d75a77b69052e-52d18e6ee99mr257126261cf.18.1786376536739;
        Mon, 10 Aug 2026 08:42:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1454:b0:527:f0a:ccbc with SMTP id d75a77b69052e-52d18e6ee99mr257125181cf.18.1786376536013;
        Mon, 10 Aug 2026 08:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:06 +0300
Subject: [PATCH 02/10] dt-bindings: usb: ci-hdrc-usb2: allow the HSIC PHY
 as the ULPI child
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-2-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NB1VGGbjbuOxIk5Mw7HUiu/hvGDkUOwfKdlFHlZ7Ols=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFQBGUr6d17A5+31t5SJIcxfjs+sTCgcn3b4
 0l8511XhQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUAAKCRCLPIo+Aiko
 1W9vB/9CocINfSQYnk27Gf5su/THJJGCq7QRj9tRZuzDC31t0zy/eyaGi/RXGdB1S1h+vwmBjk3
 r+PKXXgB3nfaqiAaNZHsFQmoqNkVRZajicGwipkCsEDiQzJ4j/99Ui5JCrIPzJQsDeVc4wqf28h
 a+NcKyVR13lBq9YdKMmLU8MGZYO/3bE7MB2fuIn6MmsZ9AYnIfgH7mZfPTq8yYe4nI+lAR9YK7B
 uaTO9oAIvJS0rwBKkCa76gqYckqSYFjYSDWBVj31cwTqWh4Yx8Aa3XmV5VoWcv8i2ct7ZZmN9Lj
 giA41d8vYvliv7yjlbs/AvZcyf6R1hgbtxcxp5GIit1fUWGk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX59rnU7Srqwsu
 XaZsqYaN8qrMVMuDtV9iwyirVC0KxZLZ3Du1mpGo/W72DT/LKaINYUXetSl5NIvygyU6qmdJUVh
 0s1d2kPoH3KOLlLvFvcCvxNJFOx4cUc=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79f15a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=PYw3GZkS7KwsNStVb70A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KnKN09t1vEW54127qr4Ssv9e-_8Lp5PU
X-Proofpoint-ORIG-GUID: KnKN09t1vEW54127qr4Ssv9e-_8Lp5PU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX3Nn1H9YtzgnD
 7p8mmVzlHlr1jdFmNf/7v2UoDqTy5ste0Q4+7BchQj9nRZLy/k5i0kHSMUEiZwtAO/wVel+d8O4
 cwSZrrzh+uzWCmDwQiM2i/pmc3BhUKFZM3KpBdgDrzFeZUtErOEtgpQ/+1Q0kGqVn0uIDIdt4sg
 LKNG+Yaw0wQmsezf/a4a80tp135cwHc5HHmTI4wAXOMugmpalDLS0dYs4mC0raBg+6vsAhc/GwB
 lkrwzaiP+tYtXyVpBRS8gydUGF0K22Ttv8nFehshbUhjIGgB896havLXCvYZI5cix6r3/MymLGm
 sID84LXTqWrykImaGjWs6urSz92uePaHaviXWjpGGvCJfpXTtBy9bWDF80j4TMy6sOcHuRGjQJ0
 N6Ks/9rnRFCsXzfoEViBtynVcC+OK4/ktCdxxOIgVLvWRKlOoLPjFk4cu5GIZLFsP1npsO4mB2c
 iZQHeq0txFL9EHwOsBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The Qualcomm HSIC USB PHY (qcom,usb-hsic-phy.yaml) is a ULPI device: its
driver is a ulpi_driver, so the PHY node must be a child of the chipidea
controller's ulpi node. The ci-hdrc-usb2 schema however hard-codes the
ULPI phy child to the qcom,usb-hs-phy.yaml schema, so any HSIC
controller instance fails validation with bogus clock/reset/compatible
errors.

Allow the ULPI phy child node to match either the HS PHY or the HSIC
PHY schema.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..97ebf9e031dd 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -83,7 +83,9 @@ properties:
       "^phy(-[0-9])?$":
         description: The phy child node for Qcom chips.
         type: object
-        $ref: /schemas/phy/qcom,usb-hs-phy.yaml
+        oneOf:
+          - $ref: /schemas/phy/qcom,usb-hs-phy.yaml
+          - $ref: /schemas/phy/qcom,usb-hsic-phy.yaml
 
 required:
   - compatible

-- 
2.47.3


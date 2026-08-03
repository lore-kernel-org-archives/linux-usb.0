Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678793D9DDF
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748504; cv=none; b=pjCqv7C+Tn1f3KyoIm1aWIyuB22x9OtkZ5fBtcV93Q0A4dKdA6keJz1L8tq6K0RCDt/vJo4hpjkn7K8rPSdyAk6tbK2ok11UXkwcFIinJMr7J9RV4xfAMQRW4GEDi3/WVgDrcRn/61lW7FA3XJJR691R0lH1gIeoWzquCOsxgMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748504; c=relaxed/simple;
	bh=Secel9vREDclEfJKxauFwPc7i7IGtIwuh/smv6mS8R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9BvUfpRmHT693zX4LAHVoyAW5Z2zLZU1b5PmaRVbp1O+3WKNbiT4u1oXj5wdzw31mPj8fbE46zYuaviNJEWxn7NW+OUnTZrwoi/+ZSFzi7TgEZwGSg5nCyJUxkUJVqmzi1ZWBW45YDDd6woTilxbfaaFKCjZmnT2iKE+NDY1Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHOHN23k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyWa/rga; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHOHN23k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyWa/rga"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736SkMn3759066
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 09:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScPbgvWeqe8
	PB1Ah8C4F8tQbu05CNfR9C2b9DwtUBqg=; b=iHOHN23k6NrFTgAqQe2JrOjL9nu
	rjUDXa1WD7u2hr2ZSr41j4Qukv/wN81OAGrB3zEUX/u++wzbaWLdJxczDYDod3Nh
	DoRviKUn+Nq4uIhiRMF3zIlduo2EaQksoxULfYiNthrbWAk4egM7H4nXPfAH+B9X
	eP2vcAOTb5+XqAbHgwl+3jr0CXl1s7iaNgNc70V4Sm39KtpP5mSeSVjFDgNhNfU2
	czkoFUkNE5167nfGr8bVYkVzjd6uKSMPaUPTh+0hrkepalOxiXngWUKIZvfhOLsB
	3LRUBDCKZD2IfgsRenNnDqVjU1gcRfjpHsg2VQkzd3eR0tXeGu3PZAuLO1Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrnrqpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 09:15:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso3811498a12.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748502; x=1786353302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScPbgvWeqe8PB1Ah8C4F8tQbu05CNfR9C2b9DwtUBqg=;
        b=IyWa/rgaJj4StZ4e4tjr/jjiYBU0UBWn0DqpxLox5PMIogekRplDH9H3uZLohXpw3l
         d2+yvRUCQTmO8iGICozdhzo3o4ZpvuRDziqFMKLzR8G3HyuoJCuLHOaDReIiOyYW/P6Z
         OswIsCETHJSLsA2tL6NJqN+UHpGrwqFehHDl5yDeLeWB4EF5YgI6CBYf7SX7roNZ20pn
         hvJljugwascW5bvlckBNAU7nihcK7Tmdq9HkQNaayo9a7f5JBM3CAYdQ/F8Ic76vm68d
         kbNOc25Nr87iR+lWFjFmH7hpgRJ99xw8eSt3KYqbJAx7WDQTvW6l9GuoPcoKJm08/jMe
         jElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748502; x=1786353302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ScPbgvWeqe8PB1Ah8C4F8tQbu05CNfR9C2b9DwtUBqg=;
        b=mMFqUVFBKku4YbFjeQpzcXs4cqG55SntD5Nlc5lQOJHBRRk19ozlHd1wGfQqN/9K76
         frVwdiw1lQbfZR6+g1/pwOWLnO54mH4NcW/TtToD+MQYKwDoiwrAe+1wyxFkIGF0E8uV
         6FJx0bRCODSjIm5QcBrmbLhOH/ckR3p+mPeoCN66CCIrI4FVb1Jg293skCwRdvh2OW2X
         JCZiu0fMmTN0PsKVtl8I8d6SEKoZb6IsHOw7N8bY3wgTfDkU8moYZFIfI3wQholTpYn3
         gu1S07XoArV4RK1wjapdVQLv3RUho+hnMDZKmkJ/xasJxJLVI2cx8jfYnl3rH2HGBzb1
         HgMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdoxhlPPuTgt7PZZ4VM81ombNt2s00BNJcDE878uXf+xjtEspzL5UZkSikkpNdtLJ4oonxsj776Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXQ3NDozAF+4ctNnEL2MA2vMATLujRoyJGTcT60AwTyKG17GQ
	fWHX1LSOrf6qoNtxT3lqDV5OtZZJoKPw4Q+qyaP7NINJRFMauCM6nx0W7LT61TOH6QpemwXNLRp
	rDhVuE579noN0qzn3r7WNvuBc5Gd0zbkZDxczd9cfcz/Od/GOXewxxOF0u6+aM0U=
X-Gm-Gg: AR+sD11r1TyTjxy8LkhvGkbU/rUqktpXzbLJgMleyhGahpvCAOd5Ii1oT2zanD7lCcp
	aO2smDyjxkhJJwPp3aS8Ja7TdLsuJeUPghtQRHwBwgFdStkuc4dQxPD6P3ukoIm/ropz9rmkHkn
	Mwk3z87/1L3TSzLSpQ/9ia3DAtmkndX90p97KRFyX3ulRK5IYrzEagHS2WkCaoh1F8s0H+NJ9my
	OUSzblU3itwRey5XIWXLXN2CynqUcs2YZskg5smwLyiuW/DBkfotITs8dM/0OifQzNpbs71nLph
	6f9MTx7tUnHLx4G/XMUpzKh1fXjs5F7UtRAlQx5tiOsRLx1gkLukFyP96jZHlFt5yR+m/SIet7J
	cloIg4RBjBnmFVw4hVBa/BQKuLLY=
X-Received: by 2002:a05:6a00:94f5:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-84ee485a3f5mr8135578b3a.17.1785748501541;
        Mon, 03 Aug 2026 02:15:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:94f5:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-84ee485a3f5mr8135558b3a.17.1785748500983;
        Mon, 03 Aug 2026 02:15:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:15:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Mon,  3 Aug 2026 14:44:39 +0530
Message-ID: <20260803091441.3040830-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX9wnhnvK/Iqd9
 sUtAxGznBq4MDOtX+hoBnBa9PJK9XIaT9cFDKlpi1/aZEUjIAhycfSWxp12+pe5KjpO7r3MnHwC
 R6e4TvaFP5MMXS/pMPzE7QHdiwN3lsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX/p4q33xqq6md
 cTIjluK0LQ/BRFAhTayWNC2iHlbbpxBh7C4ZLfNTAPvvY85rVhxiv2+DolL80OqPKHYUIi9WQrG
 h+vfml4LpCPkJVRJbSIMB/HUbqTJCmPe0iRiohUl0Bal1plS9IeRUzjBB6HlbO7Nwsa5VNbccXv
 rDaD2o2FSYVkaMHvHyXMDR+pafjQHXwC6+7YUgYAnhlScCzqGYzfT1MGX8fut5NfN6KhlwRkP1V
 UZ3PikyN9pJeRTpMiH5ylSAyZJFR0qpi/zojwmYRXhZeIqQbmnImcVPXxQ1A3aAacIukO1x8aiU
 VeruqAKDUVnGVkp3Qmql4bGiW83km4Udw1jhlMhLXJJSXEY/uvyg64L+FU4grxU/RH5E2IFGkQC
 N/nDQj5O0uWt7pDKf32TC1XgWSVbmpVE430KQLFbmv+sBLKF46TNEFb5RhCb1qkpgXypd4K3yWA
 czqdPCjsBYHWTad1Ffw==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a705c16 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=vC2bFTPnYnLVIQvTftgA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: w8j3gYWaD1hMMT4gS8PFyPNi-hTjQm45
X-Proofpoint-ORIG-GUID: w8j3gYWaD1hMMT4gS8PFyPNi-hTjQm45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index cd6b84213a7c..c0e7e2963ce6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
-- 
2.53.0


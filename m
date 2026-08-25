Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C322ECE93
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634528; cv=none; b=cAc2qY1f9ezCEkdYrJqrKOH1x3K80zOUqMQ9K8hNUKUlQxHDSvldpX6WKb4nAejChdZInHFhHgymNEC0uuMLstaUgieeKZhIsgAfAVPVEdwP56VJgIRI5D0p1+u7NM9BQfKDpT0WqkeCLFTsZUEzfi4byfqonD2/vtCOOvauKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634528; c=relaxed/simple;
	bh=j9GCy5pRGl/uns+WL0RTOovCU2uQImMf1lq+Ag4xpSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fh50rIR64+sTISRuyzJDqbcHF4RxcN+oNKSY0sNK85g70hA2VkuN7f07tiDW0t/NOh4hd+e7wdjHjuw+cit0wk4uFK6p4+q8Kj/pJ42LgCTaNsSBZMwD8bwmWP45qUP70Xisl88uqYuShnA1uYdV+fY7ERz0lEEe88z+Fvc8feE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZT0GMHre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esJDfCa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZT0GMHre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esJDfCa9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RJUn625256
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=; b=ZT0GMHreeoni+Gr/
	IPlswrBvNqZMCrnBXDmHlJFit53D6bWY3Fimwf8+8JGksCRintS8YHpFQFoIkGRu
	EOpoOl0DCekWHdY3cp9s0jcaAmhOofxx3jKxVXoTJvO/3H73vFk9G77IxSBq9dOi
	vQnRSo9KDDrBS8JygAA5ZznCgTSy7EyyXQjIw+Y7AToyP64OylG68Brj2ckLUV+z
	WwwFhDB1MzYmHO1hldwPj5cx2ze9Wu/Jt/2SchxBQOJymkLBsX7YHCjyUi8pIXPu
	Ao4WQ2528/+zLEF5mNNT+I6nkO8801Bz9Op3SPPJ72usJcdCj2/ch0HZNwwGAgdP
	yM+VIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdk87j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:08:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee894b3d8so77151455ad.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634525; x=1788239325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=;
        b=esJDfCa9V4qbLwwMrSch8IpJFJPIWS3wY0YcPIgJCu5kub8oZTuU5MqnpkgCXURVla
         h+tkbMEurZLC9LyWSrPcK+FA1TY+JYlrU6vWp4xEc1Yp02PRmoLTRL/ZFjlKwSl897ta
         zs5TYZwuQaVrrgmqcQk8qWwFhwSNwYHQuNQV27PEiPAuvQqH6LjU7o+mV/mR5KXxfblw
         6EF/D6mlMbTxAm8v6qO+MdkZaJ7KkPWrYGwBuG7/XXOnv2YY44HEnbftJgoCiooCg0XJ
         3WeHFxiREnM6ECMxkYh/++pWamXWja0xQr9eHpNMMfQETByFFg7WHDcs60AQY+mgbadu
         rCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634525; x=1788239325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=;
        b=ckNw3524z6IXC8O0TOv+wJcx5KXnpg8dhsrZpTmfARI3MrFNb0bfO+lF/g+gLA6DyV
         f4zdV6RnNbmPFdecv+5X6V6sEXFeDLy1Dq/L5XHX5XY3T61jSTQF8mJ5d1ITbSBbDG5t
         F2z87umhMuHtgGuAuxjoQhXc8jImyjgHLTs6uaC8WPp+YxWyFem5PJjfPzZ1t8FZDfSm
         fFjRkwPL9cY2/Jw7Qy+JkEXtN0yS3KZQY5Qz7HZ5tZ+z+WaS2OkM1wPCvdSbjsLbV/Ei
         mHN8fdUVL3IHXD1OsJ8rqS3oU9N9JoIfrZ2covdjC6GNLKDDNmq1xhLV603HT7SyGlGL
         NewQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/L/Ku72G8AU7p2kMIiIiCZnZQhouhk2sGXAab7RT3qhVz5Xk0qM43lcrMP1vItBQnNzLF7TxwqTE=@vger.kernel.org
X-Gm-Message-State: AFuF++nMT4oFnxekQTt8+kRjYrlm9G39uIOzsfH9gHFM5rzCBHni5BxG
	YztYE8+0tyPS1Vh31X6XZaOMXNaw0hPEuvOISfaRXj0Gb3ZZoyKntNbYgErXTkgG+ZgRvcXejGW
	Tm7drrh7zoV7iH0/beLaHuihDLhkVFWKpQC+8AgwilmAw6TXb0DrImzm92kGqB2Q=
X-Gm-Gg: AR+sD11DuVQo8ufBKFZnZHf+15h81oZGE/xSHA4GBkKS+vhz9IKN1HxoftOC9UuHYX7
	eBnmmE4M5qt4mRfY8Fnxxj4qUcFxa7amy0E3fnQsE9kdF6cP8ccRS49maXDllFAKGVr3pyh0ZpQ
	7TTMEG4Ab/dxPqcHGrjSKhVakW6agnBFlhYipcwHfR0tlELeqKkEyIURUtl9+1URB8rNFyJmqSL
	HoW6i5Qgxw1mciayaZHvYbkh4jH3MXTitEk+3eu9SDtF9HMfy2p0YF+n3daG+ln/JWHbgwoDYAb
	3y+TLHOva3VrwnMJR+V6dW5NfmObbHamH4M67iEZHiOBvMEdkeXC2jE5zA9+5EyVdElSEXFRZHM
	Ch8Ec4Wa0xucRjohJhs2efs/EKRWG0vjnWrFu12jBw74oNzTJzge9CyhNXhFM9NKAysWUk4WIuP
	0rJIA8YsVMlFNBjGB/eqVf1i9TGv6h+A==
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr48361161a91.15.1787634524708;
        Mon, 24 Aug 2026 22:08:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr48361061a91.15.1787634524239;
        Mon, 24 Aug 2026 22:08:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:38:32 +0530
Subject: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ctrl-v1-1-609e2291814d@oss.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfXyLkN2SzOYIm5
 bof75o8xOZeGQ/fxjF7E8TOssAxQO9j1mtNNStVNa9k1VywY6Ib9O5zug6/08ju09DJRI/tn99m
 XHqQy/jzuLqNb0SO1IrFQ22ONg216oA=
X-Proofpoint-ORIG-GUID: e3F1xLxjCfrVzW7ZNigVOvDkExiRmFNw
X-Proofpoint-GUID: e3F1xLxjCfrVzW7ZNigVOvDkExiRmFNw
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8d235d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VKQxD5uzQ55vUxsvsp4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX295+bcRA6TCY
 vUws9L6iA8Hocm97kU0PSor/CfqSv8/57nue1Jgt2QyaGtom089kU0tbVe/CGxrI9qTjRE3d/CI
 4IN8UaeRQvH2a+QaB+wl4WJRZhxzRVap5q+zzb63oRxeH1J5VaJo9ZGB41x7yJ7HTpB2ThKEnLW
 caCatl+Eu+Ne0OccnbrelI2uVHbvE87mxIha1eunb+4X3KL4imqUTMGRxRiClptxAGuwu1mZzu4
 n1Pp7k8dDywBI1W+p6nVCLv70zozcohVSuiWp2gKwOM4xcKwWho2f9erm7uGX4rBcN1F5GGdjQ2
 gcf7vEChKZSWD/9TqvEoyeOJJKyYPAC7lHUcBBSKBQlLa2H2IMU4A7jA67vvBF6UmidKlMArBdZ
 4Ye59a/NWyYjg4Ofw7rJDh1iDmASFLN4TjMtY1y74oWHohxoCK2b2VL58UpXEviTkVIvWosvjES
 HXefzTsJ/J009rrpM2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250041

Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.

One controller is connected to a High-Speed PHY, while the other is
connected to both High-Speed and SuperSpeed PHYs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..603d509a6ba1 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,ipq9650-dwc3
           - qcom,kaanapali-dwc3
           - qcom,maili-dwc3
           - qcom,milos-dwc3
@@ -387,6 +388,26 @@ allOf:
             - const: mock_utmi
             - const: xo
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9650-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: ref_clk
+
   - if:
       properties:
         compatible:
@@ -506,6 +527,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
     then:
       properties:
         interrupts:

-- 
2.34.1


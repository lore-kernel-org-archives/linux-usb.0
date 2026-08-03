Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B77B3D565E
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748509; cv=none; b=NHUw2y/9QESnsdWwolOAjaxEjqtuTbircrhubqf9rjgeirn3OndV4g1lIsHYNuk16A6dcVEfRSMHr2BnS1shpJ2gM/UxFRRab9/iyntWYha/no1r5zSPXT8+oOWuCNkspM8/OndGFk1B5w2+LAHzft9GZS/lSQC8YoikLqjarCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748509; c=relaxed/simple;
	bh=YVBftsMxqEyBM3msR4cnslQWqNvs9CAJn4EL2Iw11Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0mEsfv4ZqUKl84GBWzU8yT2P5w9d/Pd6f1BRdyZ9cv7UhEswd/oUIisjpjLMNf70FWr7wlLW3p1ofmtbD3fdvzxyG1XpUbVlS5mZnmXcH0kFNcZNpFRiqF1tIrm4Kuirwmf0xea/43WAgxPjGhy4To39//0cXxGkjSpqqLZrVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6s+po2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5qs/pgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6s+po2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5qs/pgX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736D37o3654505
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 09:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qhQ5X4XsQLF
	KGbaA430bYByFdkn1wqwhTXB5LdY079A=; b=H6s+po2p2lbX/FAsj9XCPvZT7Gx
	+jneZlN0ByF1DlHkBKjE7gQM5oeXZURh2XVUghRKAZ3642OxCojuVkuMidplt/Az
	GaQVM8DVL4nNNMdl6sm+1NjkTcuB1YrEf3QqzTnnuzuhRo8zMA8a+psBxr4vyBCe
	E3rf4fScsIEY5IdUVhCe1MYfs2ngzIMzv51FpHuAMQjMT3H11ysaQLk4V682quv6
	SGEMJ416u/jA8EqGtrsfmZ9WuJDrX3G1e8rGecckzg6Ot/NVGfKFBqyTPGOMQNtz
	d8KZFSfoL/IebPWY34OimutB79UZ3qrut8DCUEAYSlvzJHDMu6ocovZxd/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb0tjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 09:15:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so5879649a12.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748507; x=1786353307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhQ5X4XsQLFKGbaA430bYByFdkn1wqwhTXB5LdY079A=;
        b=X5qs/pgXqas2+RDDfUwJ7bRnc9FUHWKVwzssq6iZXjnrHWQsjITc1jY4N5dbtGIodZ
         yskJUBqT7mAbzelDq6iCR51J3QsYPGrbz3CPm8jZCY1gGvJqbJHaXK3LhKHtfAakuny5
         vyjiM/znTlfXVgzMCV8kslY2Imsqc7ZdWJeELSK9ArqzIUd96swlXs5CZyCw688Cexkb
         Mu6+yd0VJkOAJzFnU8XCKPkTvt4v8+a15zUjyaXB+2AZ1uFFJLgp47SflRWgZ78tmY16
         vrQQDfj9CX5AzvS3Bp0aRa2FYtf1ZaYZZHi2Ku3TDzuVEimKtNQp4GPL7EYd9RXkXg93
         Y7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748507; x=1786353307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhQ5X4XsQLFKGbaA430bYByFdkn1wqwhTXB5LdY079A=;
        b=lIFLhZN5/CxOGhqV8G1Gec9Eoamq4NbCkgPi1kYlMBKN2cPNJv/VCHql15LRjmRDZe
         rcx2C56WvehIr3djLBVl8Tywqwv43o68ZUXQcbUz0WETiRZ7XOUEsKmTIdYSowvyYCNb
         fp+bR8CJCm21L3599bEjwQLWOntBdm/rH0Z9UDZJvpjm3jOg5UMaFR8ynSLVULmtxQ4l
         P75KbccHP4uY1V1a/yVCIzQFMd06iodI08szDTieKSZ9qQrG/avVOYy4J+AenoTf5HUx
         9tZ9BvHeEVAO4OBTaylt4uYxvD5JOSBw3tki9dbVY23yQ3AmCBdG+thHr84AMT2TQ3jE
         muSA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4sgddYu05/BeCp0xq3vabMzGyZ+5OODE2bFU4daTCqjmvqHmvXZd92cF54E4KRdbjGrIoUWuHhsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9CoXvyn2jOAzD8rqPvdHhl72T2LPuPC8Pl1lRD0nJIHziHtH
	zRLWnBwoToYD+KlPj/ORP4t7Pc+q9mCxwQfHO/JMPG79xIpWK8bs4RnEer7TlVqrl7132ih1I3r
	02uGNTc5VzsmIkR9aLYgX1h2+eXh2RQLOLidnVvjBwtIZMV9acp/8dI/775uQlwU=
X-Gm-Gg: AR+sD11ttntpU2J7guugZJarnYgpgeRK3FVkc1CuuaYSBqwVpafi2SQGEkjxzlgDvif
	PC7wa9mEfXl4md1ROF4e5GGrD4yDpvaeR62S+vNwMh/bqlShIjr+GZhT3MH2+MFHNCguJA7gVly
	EILPSjXCSMOwDBNQjHGRE5gKTiIu1RSQrpJyJxx9/d2s/Ad1g/HTDHG4rG6ie0vdtQ6p6R1L2SG
	SkgnJgIt8BU/req7Uu5UPdabPb4E5HEoq9fri/S9Lmi3dqJPTUg4a4VAOiL0D1fdIcWFH7gW72B
	j4d7pA52dRjXuI6jariVJ9LPQEAQmytNUPLJkBwYHuPRka8dsuSaS1JF1PB11nKr+Qy8H6w6d0Z
	rFH8rCo+LvwWH2TdWBfs2n2JTAzw=
X-Received: by 2002:a05:6a00:4c0d:b0:848:76af:db34 with SMTP id d2e1a72fcca58-84ee49b4d9emr8730027b3a.76.1785748506771;
        Mon, 03 Aug 2026 02:15:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0d:b0:848:76af:db34 with SMTP id d2e1a72fcca58-84ee49b4d9emr8729992b3a.76.1785748506175;
        Mon, 03 Aug 2026 02:15:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe572d1sm3516376b3a.18.2026.08.03.02.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:15:05 -0700 (PDT)
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
Subject: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Mon,  3 Aug 2026 14:44:40 +0530
Message-ID: <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: nz3tVKd6bhbOFNsGfVhPEXhM8oK1W1an
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX5jSf8z9pnp1A
 vw8L3qH3IqDoI/1S8shNucWTkg270kct9gL/Tx9M5ch2f4+Ijo7T6jH/CtJ5OGiKx/ZUGxdtFOx
 gxuiMMmRu/ihIRdTmSgXUDiZ5hXdTE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfXxXv0PngyFjTm
 AppEfaETl/rVhckwh6HWCWRoTcrWQCIoIfbQkWbuS2o0ddCBgdaH7EZ/Sp6nqB/zTMoxFSn6kT/
 SESEoVAwx1+Zkz1xiO3UO80cfUoKU6nflL9DePHD7twx93aJgTj7U6f5wb8T+Ia/CwxH2XygmHd
 hIr9QKp/ioBayJfoK9WQmPQunPEQyf/EIgKw2ZAj8vm/7B9TLrcwYYsima/GrUYAVSzBp8aeoml
 K+Vw+82++1PF2OJ5rj5IH591If/ucCQv11Y54J+ftlw38vtNBsuayaDcGKHUKV6SNf5E3rIl4f+
 lgpbqO9XbMiSzcoW6a8TSwjBgMqLKMhFutOh3n06xkcNpaH4DmfygpYxlAqcNfB5morfvJI6pBX
 KvdSVD0i8BpUoLQiMA/akmSX7f7ZzM+qRqLY5bGLgkqDw50ehQ7eIlg9lAlFch21FNzvyuGwBw0
 DwcybuIGw+NjffBe3TQ==
X-Proofpoint-GUID: nz3tVKd6bhbOFNsGfVhPEXhM8oK1W1an
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a705c1b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xJ7_bQKFY2SeBR32x94A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..de50d7a3c999 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5210-dwc3
@@ -206,6 +207,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
@@ -547,6 +549,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.53.0


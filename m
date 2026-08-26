Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC2F345EC2
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763835; cv=none; b=k3yGdhlOPwmouazDioI6hDh8Kcn2cjteOZkgHBgw3p06Z1ESxkFAoHE7/mhjTRkQyj38OADeH42dtFp2cwshRNGIBHfSOzhcqNeb8aMzm7lbUEPccMlJPvHJUl4HmO6KjPb9Ku55seeb8OWjW0mgrLAodvJ3kj9FK4zApwAk3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763835; c=relaxed/simple;
	bh=Lg7dXbsjKWPkmEu+dtLIuTi/8F0mqFp8EHzxlsCI39I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0ATVEXnsjo/IlgBW90eH0XNfhvf45ikfLj4y/oRirIvbjNN3HOHoLz8klOmJtcINMuaHXOhtzyAm0uUAtHu2tW8H5DJu5lyApbn67zkX0FZXr3RkDY1caXoJEEYlzqfQ30FTOz3tns7QhJ/NcM37pTKhbHvO+zfpETcCIXhwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0bRzxKr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2U0BV+m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0bRzxKr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2U0BV+m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuuE01522571
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AJD+AzP+JrrmWgE0Y5phGOHovi+llbm6aiOxr2aNhs=; b=F0bRzxKriPz3/sTj
	2WfrgNYsR+/ABpVIeI8jZe4zgbl+25JRBrkhYloN+vFFnleIHAEvbxW3HOBFMSbd
	Lr3FaX5JPGoBNO4AXNvchMIeI91yo6MGnzYNXe+6vKFvc0cbsfEWWEvQNVQ78EK/
	q2cPluhf8OZ+e9tMgdZXucEsy97p6Bi3vTLqPbmv8W+empWGB1BiIHjCDp6dErEF
	TZsNF4jzQb5NrIMIyEH8wNzERo2O2APJivTK3ngv6Ivd0q8VgtSJ2cW0m7qmdUQd
	5ksvnXBY+XFGK9Zx5ssnRE0DwWxorDryf+eNPLF+Cvy1GKoqUy6B+4Ko1pbJyZMS
	GEvBAg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k36vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso11261745ad.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763802; x=1788368602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AJD+AzP+JrrmWgE0Y5phGOHovi+llbm6aiOxr2aNhs=;
        b=G2U0BV+mijkwAE9n0wMQ99F87jOPtBEl31BBYEf6vgbN7zYYqgJdLz9AAAOhdFL47p
         XDdt4TKetkrWnHOd+p1FqFh2/BqfiZCA/0Ge5uDprckr3W+gPQdm1lUI6ROM7UF45Atq
         sY6zJHt6ji9hOQvygqHBAUB00sjp5KqVeNM6oRHL4rWL3ZztXO6aAbJb/dESN9Q86wyg
         Nu1CAR1+njpu32S9ucFF4GO4j6j0QTYEgmKfhTQT6YwVjUtVj0gKjFMjrTN0OuPKdeLP
         gtoEFN5xO7l56nOMuB1mYsxsPSkmqIv9T0db5i6YbDm/zCTBcvyXMnq+qGhgQMEHH4+O
         n0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763802; x=1788368602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AJD+AzP+JrrmWgE0Y5phGOHovi+llbm6aiOxr2aNhs=;
        b=rqEQwu456j5yKyyF93sctPrJ7vUSrJ17J7Y8Oo4C2fwRcBre3K6W2Nmb42Xlvd1fSX
         gr+V5ZgnK46kOk6wRqSyqf1Ade+qjpBQvLPWYfrHHCW7YMK15k0x0TqzZ2p1YJW18hJw
         FNJlhvm0gMSHfOSQpsQeQ79bRRiXcMXUqLhyxmguZxwnp7jdKB0g2gOKY71EtqGdCrtE
         SowIbiXkfx5+MrVkvz8DZqrNsr7OscS1JERsQlrkMkdcZZKBsVfG/VyYPK042sNOc/ie
         Ny+y16FOP5Y1CwUjMt+uTB2IeZU/nlLZeX7B+3xD1wmhmajrjPPxVm2b/KQgdcT1Z8ko
         yZ9g==
X-Forwarded-Encrypted: i=1; AHgh+RrsYRsdLrfTYW4s2gIJ+XdoKvxRnn+gLtrB0OQmNsbNFxEZG8MK/0NRGDRrcJaMFIMGHtVKubsSZHo=@vger.kernel.org
X-Gm-Message-State: AFuF++kgJXgCL+80GeqmVDComLwuEnQlm4XIq5m3EfZw4FA6JcKGFk/O
	eIQK+2TpTnjIpnJK/gJx2+FV02dgDKRZaINSr2w00HOQ4Qfhx0Qol7EZf3XBU+IJ8loy3gGTFCC
	LqQpMQ3MrNsxSelNU3XNkcVuYkitZ+NjaMw5F+mTp4TVT2X7X3DkZ+D2BSBd8xd0=
X-Gm-Gg: AR+sD12Cdhr+AZTmTTP8jpFN+FRt4d/Nw/4nXVQNrggwgtJbC9f1Au840HmcQWmNM7w
	uxDfX/h7J6c9OgHKXVH+aYi78CbyVRVnqf46hzvUhEymIdDASCxslOjdQ5kwpLDhJ9bGPcbtmsA
	+fxv1lVyhumzHtuvWWxRtjOawyKYLOy4QvhPP6cPxY/Sq4M4SkGlwYXE89/f16sVt7LHTTOa/Fq
	k3Z/RI2SXwiLVuFlNLmYJU7MtqpLgGf6rRZ17yJ3qlpqJgAxHeKoMIH+ehqoZ4NSUGFuM0pqxpy
	Of+57Ociir+SQ7iVKIk+l20gu82Hd4ahr0zsDdklfL1ZAJ36wG42ayyzcyxmG8nFlvcdbMeN6Wb
	+e4maANoXSOwW8rbIptoD43PwyDbIMbF7pYSaU7XNgvt7F9WM804Kw6MIxjMHUkBZ9vlmmA==
X-Received: by 2002:a17:903:4b24:b0:2d6:d3f9:d394 with SMTP id d9443c01a7336-2d707833c29mr149993695ad.0.1787763801473;
        Wed, 26 Aug 2026 10:03:21 -0700 (PDT)
X-Received: by 2002:a17:903:4b24:b0:2d6:d3f9:d394 with SMTP id d9443c01a7336-2d707833c29mr149992545ad.0.1787763800999;
        Wed, 26 Aug 2026 10:03:20 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:51 +0530
Subject: [PATCH v6 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-1-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=1817;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Lg7dXbsjKWPkmEu+dtLIuTi/8F0mqFp8EHzxlsCI39I=;
 b=GIIEjwxF5gDLt8j08B+e2UqpwO40cuL6q6UDIW7iwYrh1atZKUMPjOEFGIZJiGVjqxJdkQW2O
 fIfW2rXT9nQAG5baVP94QA21FpyFq3cW+fMYUKBhbuwECiTvLZ2tk+E
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8f1c5a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=L1EOSesq0gyy4kqEYQ0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX/BP9SEy9reK5
 f7KNnDiS4i/EddIpIzgIhvaHmXQAWCKCdbCpLZ1IrhJ+ZnCPBRJMhV/TZH2zVF+3JOTQmPLLNz5
 4d8p22DM3NVBZF51QnmXAyD7kR/cnoM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX3a5ORFA/+94g
 RDkZoKj2A9/WUYzuzZVSR0M5pYDZZFO1ZQrjS+TM0eygvHd9TB2bOaFC+k6q9S051Dpx1GRwb6X
 /EgCYyfvMvBzc8ZydhyUmvCOBSjoR2F8ICCP0Tgs/upklo2tQpbkCMDGLfYywPFDI+MmD9/vDPE
 aZuYuGilsz/K2zV6WcRmh4Vb6a7VJv9qD+lmbCQJMPRubL1wpNjP5RFh9YXHmd5NOPxLwPTClYC
 iKy6LxBtLbJM8rfQIWvm3yQarOTjCj+cxk9voRvb6Gy4Z4ygwiDjY3mFuFPtaGb7lopDNEpmkAL
 kAp1l3yHyuMRFSupAm+qjlfnhK9brZ/Jtl/9ybRc71dt2O5aZmFxkVk5we4U24jIovvqTcrnE6F
 krMgZ+/ok56KPhzEGMdMR40206H7gSB7LCXEM+wZVCfilbQ/JbnEcyxvUAQ7mDOkv4tsxaJ5JbG
 DkLC2KkaY/xjIJT8YFw==
X-Proofpoint-ORIG-GUID: l01mLKJ6k1BIlOZVvsrcAvlycgsMOBmy
X-Proofpoint-GUID: l01mLKJ6k1BIlOZVvsrcAvlycgsMOBmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

eUSB2 (Embedded USB2) is a MIPI Alliance standard for chip-to-chip USB2
signaling. Unlike standard USB2, which uses 3.3V signaling, eUSB2 uses
low-voltage differential signaling (~0.4V) and requires a repeater to
interface with external USB2 ports. Because of these differences, eUSB2
PHY initialization sequences, voltage tuning, and register configuration
are distinct from USB2.

Additionally, eUSB2 targets handle wakeup interrupts differently
depending on device speed when operating in host mode. According to the
eUSB2 specification, remote wakeup signaling in host mode is detected
via different data-line assertions based on the connected device speed:

- Low-speed devices: the host repeater drives eD+ to logic '1' upon
  detecting a K-state on the USB lines during remote wakeup (eUSB2
  spec, Section 5.5.14).
- Full-speed/high-speed devices: the host repeater drives eD- to
  logic '1' upon detecting a K-state during remote wakeup (eUSB2 spec,
   Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's DP and DM lines need to be configured differently
from USB2 PHYs, controllers should be able to query the PHY type and
configure wakeup interrupts accordingly.

Add PHY_TYPE_EUSB2 to distinguish eUSB2 PHYs from standard USB2 PHYs.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..555a022c8c0b 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -24,6 +24,7 @@
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
 #define PHY_TYPE_XAUI		13
+#define PHY_TYPE_EUSB2		14
 
 #define PHY_POL_NORMAL		0
 #define PHY_POL_INVERT		1

-- 
2.34.1


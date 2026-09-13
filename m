Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC83F1AA2
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310471; cv=none; b=C4i2lkrUWAGaa6EvYdSq2eONedCM6rOo/BCxANL60XxatyA8QebzyABuP3UMv7Bi+DmTSAJz+Kbqmo0ggyGaSih7k4XJ9ly1IiRHI4YrPCdYme9Ibkz8Da84TzjhKOo+NgcHGHX9yJ58GFODuOSzP54/lqCK5Q+HUPUOZNKE4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310471; c=relaxed/simple;
	bh=Dx3ovNJlM9aS0KyPy/KkFqWuw6/wLLR7Yg/2GW2PrQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPqDuSdr6LrBF+1ozqUe6AIVBLRqPO5BUE0YQZOZF5/fBLTPDjNcxZl03QNRbv9FZ1E7LunTBj/Bhisr4Mg8thnzHDSKjyNJXr7B5FUi4UXVglYeAVM7xJmoO/1qg1sytNX7VxVuDN1vICWVyof+xPzGHE+CkEh6dlPBadASeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhCZqfH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLxBNbJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhCZqfH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLxBNbJQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE09bQ1434592
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0uly6JHLnN++DMu29WEaZNFPjIiWYw6gQfnWNoZwd8=; b=KhCZqfH5vXYGq+r9
	YaIgXXuVEHTOu4an/u+6WgHN8AQQ31XlHdE9KN7JDmbfoNvJzzHz5y8o7S2vtnIX
	P2ATiz1I5fdtN4jSc3fJNDid9Juv8hMzebrgFCuCFs5uKoHs75NL+m3K0eDsD5dg
	aJEJ9xAhcOzO4XsFIWmL5MfSIB78K+oAnkNHTDmw8JrNdMzVLax+/FyHXR7pu0fa
	9GTw9zkJdUZr6e/Z02J4DlsgMJ8HgED8SA7tWdox+c4G0emNviGVg4791p0jwkCe
	H/5KWenF/FQ8kU8xNFbOz9ixzCI5KybUmlN9EdzLIVnHtsB0B/5QWXBC0EX3QGmC
	qZRbyw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd3h8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 14:41:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so3036179a12.2
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310468; x=1789915268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0uly6JHLnN++DMu29WEaZNFPjIiWYw6gQfnWNoZwd8=;
        b=KLxBNbJQtEob6ypPifc8lhj2eQVNXZUr3tDa8lgvCWPqeplJR7wgCzvzxPcJ5tN6LI
         NAE+4cB/IUpSQ3e5XmVo3SiONR6/PzceMMviXDCF3g9rz4SW2lmIpopU5v2fuQIqVL7s
         ORYNYth6nsdeN2nBfOBBwn3FL9TCE9yCY3+IKTgUvJCuQWICEV/gkaXNm/Hhj1qTKp6G
         WyjX9Wom8g1RJJnws5WlxMt2LpbVfxz9FJ1QVCif6XX7zWBvGLcmemIhD5I5kIcLYuNn
         BKEXhxN7vjIhXW7iXLYmaofD+Ek1FyETzNU6UkNrrQbLooz5ymUyKTSDLFwWWMVT3POJ
         lPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310468; x=1789915268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0uly6JHLnN++DMu29WEaZNFPjIiWYw6gQfnWNoZwd8=;
        b=MkJimwwrzZ3yzKT8xWLaTJMK2jLqju2iDLD2Rd3OWjusmnH/Kmk/7/7fYLhqyN42U2
         n/3Uo+fPZRUVJXadU9j2tVu//2FBk+Fj84zS1NiRgoNVrDcY1kGojYhVzSLqa5NFyM+Q
         2Y+ybW3ZXYVGeFhio3vax+I1xLcMMkX132n4OQHd0zKuqPxduShfSGW8KaMBHOTcR/BQ
         lT2QClBwdHV4ChAbljdXlQl+Li6cM2SxQDdHDl5nI0hQC3bywd0l5ku8dTIpBCrxq9R0
         aWkz2xGS2YfwyGTRQ2mtc1Ik/cNahLvPWWDRV0iZLq10qIVe406y1vLB2wwcw4T+4NGW
         MonA==
X-Forwarded-Encrypted: i=1; AKwUvBypJ4+LRysEYFghNOf68miQeNVa2ZZ/d8V75V+njhvdn6CYXzuD6CaQPtGpXQuQlXMOK/drd3FVSq4=@vger.kernel.org
X-Gm-Message-State: AFuF++klGLQW8ei4AgymxVvCiCUuiGhNZKFm0Yg4D0ey0e2OSrjXtCto
	Bjdapps2pzUAnUZPBTt1h0MsdMxvcWiDUqRQ5bn7Lhgo15EUtj/0x5BOqTcXDc8mID8hgyPZjyC
	DH1LNlNDTGG1bLw/AiEaCQsXepA9Ye+eXad4YO6iKjE+ZP/YBCSV13cv1s3NxwIc=
X-Gm-Gg: AYBFou16kFJ8OGj7BHKZIilDg5qswrVWCTWIQDNj7LEbZu9A7MIJRu5DxOTYWRwoP/l
	z2HWW8KuCQbbDPDRlL952a1pFmOdDo+BroMJ42tu7Z4fIkmfwehtYGD7wIU/O7MJWiZKCkqMmqY
	fTdhUXFzQANWdHDAxaiHIDatFm+2ekiTXgJ7OUWa2axms+DnL69nR3lf+sen8+KgOUP4oJW2PyR
	vSZxr6/fSTHrSfF41W/W+W//CYRvf8ocvsn8D4v6ZcfR/34XXmYLyvWOT5fWJyQo/hVfMoVWRww
	7SIMgwmTKnq/6sSCk7PJIlAGKkJ0OIJS/MyOC5f0xekg1xNw238E1IvD6x4N+QmXMVmCs2g0zKM
	EaEKaM0T90Q2O+k10Vk5OQYxzpWbcafBdLFfIDpKC9V6pIkDvrZ4NwCFYKVpCf8+6n8xUgg==
X-Received: by 2002:a05:6a21:32a9:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3db0e485c2emr13344568637.20.1789310468286;
        Sun, 13 Sep 2026 07:41:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a9:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3db0e485c2emr13344493637.20.1789310467806;
        Sun, 13 Sep 2026 07:41:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:45 +0530
Subject: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=2358;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Dx3ovNJlM9aS0KyPy/KkFqWuw6/wLLR7Yg/2GW2PrQc=;
 b=aD1Pl6wzsZlO8t0tJjp6+liaW2VZ55woEjDK4YgYpMdoEpojaDpkr2nuVijBQkLErVGWgXfUT
 r8s3M5rlZuLDT4F1E2SJuiyt0DwY4f+4hhOK9s1OzuzyzyemFuCuqXf
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa6b605 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX/PeqA8XExXfj
 7aL1z2rRXRGjoFiDvCCr9tA0Zqe5ipd/77RhSZoUh7kukVT5LUJGvgRg+rEnu1+iakGKv+3mxig
 aZzVl2fW6im6pwospD/QR50X7MyI0iEjgt60PjnFNFBjMAxQjGuWT6SXuEcKpL+3mhUnx7a+PQt
 8IOipOrZJtlw6UxJ0gz01gPb6MpHNwJg12axOOsAIP43Oh44MGGa2X4nKFRP8S9o4JpnUYmi4x4
 G2NyKDcdcSwhqdNSXyMxBDtlB8XL1RlT2PcX5VS/ivX3fmABLpbP3MDsPsnUcmzMMMAcel/7T/J
 Kopg2EV3pRSLMqMzQZc+0NuKNQuxHySYvJbmM84jy6USUAzfim/8cu7Qg506vI3hujZZuK+2AwZ
 Yq4oW0/YSWbuwWSwu58LN+fmrXLloi1l5BI34SI08drHqnLJANU7A25O4osecF5x6ZcdYaf+S87
 kY55AsMYsQQ7GXGMSZw==
X-Proofpoint-ORIG-GUID: HDHazpgykUTqw5p2DVQKKdl9Tft4Y2sk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX0qwz09GOQ85B
 t7yuVhU2ZcUKYkPx1NbWS5FeHC9+LltSoi99e9iKR9/lv4EAbXS8IqfH8vpJPFdQC0ivNeLpy7S
 znyuZKo7ggNSJSd+Aeh6b14V3H6K/so=
X-Proofpoint-GUID: HDHazpgykUTqw5p2DVQKKdl9Tft4Y2sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130210

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..038c2b58bbe1 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -21,6 +21,8 @@
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
+#include <dt-bindings/phy/phy.h>
+
 struct phy;
 
 enum phy_mode {
@@ -152,11 +154,13 @@ struct phy_ops {
  * @bus_width: Data path width implemented by PHY
  * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
  * @mode: PHY mode
+ * @type: PHY type
  */
 struct phy_attrs {
 	u32			bus_width;
 	u32			max_link_rate;
 	enum phy_mode		mode;
+	int			type;
 };
 
 /**
@@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return phy->attrs.mode;
 }
+
+static inline int phy_get_type(struct phy *phy)
+{
+	if (phy)
+		return phy->attrs.type;
+
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+	phy->attrs.type = type;
+}
+
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
@@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 	return PHY_MODE_INVALID;
 }
 
+static inline int phy_get_type(struct phy *phy)
+{
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+}
+
 static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)

-- 
2.34.1


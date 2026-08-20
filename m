Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8572E37C11E
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237457; cv=none; b=QJTdn623eieeKJCSViZB+VhBPzUXmr0ziykMzW9hk1sZzgUX/cRTmKwr9V1fKTiWR5a6mzO00FCcxwQS8pOhbJFbJIrBWY7Ezz/3+ufsaj/Q2OeblOJH61TaMhI3fUP2TkrC9rQ+XwReXfHiU9hJ60tUDKKfoaHgdQjrATJJXMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237457; c=relaxed/simple;
	bh=wo+u3YWeKj+W8pl1NIWMDdTiciUwV1jwvTY3dqUCWkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aX+8ThXANTPOPXxBbBJYospN1/1i+we10XkqwgAxiPMhkPXQcquuV2kdVLCnRFPJIY7Cte3ZPFnYLPvI+sf8358Vz4fTQ2xMRP+lGdLApLDZQvOjF9P0DJ8D6MdPPyLLNHJg+MnKphrhEPEm9yE4W2MjsJrBst3D/y8XrYZgVhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eja80+Jt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cmDQkpsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eja80+Jt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cmDQkpsp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7TaQ3464869
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A/9hqo/Rrzg
	mEvda3g1SNdYaNhtBxjx7Sp2rY2ny7rY=; b=Eja80+JtIA1Mld6NbiOnmJGIn02
	4j4sj1ySoCHeiH1OryQSi0bvBGwXMzusWmlmOgR6hVcn7bk8mLIVDeFJm/NC91bV
	im/fHcRC8sA4bhlV5mX00QFiJTVWd9A5POyx2/c14cyuX48CXpftk7vpE1wbWzk3
	h/fRjvyX0Sy6WTD/dzEL8OvRz3KAd5OEv1sRitRHu5oUnNhatMAZmTxzUwG0keYz
	Py5vReiKge3uHhJ92VElv3bUoAzEfYRfHoPo8LBmmE+KY3AHDbTO5H/nzftuD9Hx
	PxSTy+rCSCnRcDzn/Ie0mopb7ZhvnZMDNO1QskPPxcCJYqG9Su1DLKEMphg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0h5b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:50:54 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6ae731a7e94so477eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237454; x=1787842254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/9hqo/RrzgmEvda3g1SNdYaNhtBxjx7Sp2rY2ny7rY=;
        b=cmDQkpspA2OD7TNyIe8VutpyhWoEu+vT9qJtu/fs8HqnArD8XLUQlEX6aHEAFID76Q
         rfavMAaO49DaYprFY4cyoiepxUNREu1LnwJfVCKvkhANj1zRgMNr935pUHu31fbjdoph
         rnX6NUdmX9ApDmPuCA9QK8PfVf33rvIKZh1CgeLPuVPW4IEjPE/Q2du9y+7IMnzBSAmK
         ec/5m6ScThjTcbV+JcVANT8dxS4YTpMzJf1Gys9emXV4x4sJNYpL+P3XwoU1bjLS3siQ
         evpy6yIVTP0MoBcvwOmu6i3qI8kKgpZjkB2y443BAj8Vm8glR3Akogeit43YKroeCgyw
         nW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237454; x=1787842254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/9hqo/RrzgmEvda3g1SNdYaNhtBxjx7Sp2rY2ny7rY=;
        b=j+X/6nC80e1W75Ot/lGbixP12stLlVLrPQg4d1tiZmBno7gCM4Guwg80mar+1DpUCt
         H76UoOKQMOpNsP6Z5JfxUy8AnQmhrYBjkYYsGsz9tKyoOHvxtPNwSRtPya9hBv2R2hck
         0rnRLZ/OfIXxn/YV2GCaDk28tJ/HloZXbqZsElzOj4OYKdiI0X0AYL224WYqmkpB2Vcd
         JzXidlaJr82IX7MeoM1ZcJU3SemP6GJqVJojihDWKU9NPvhNRg0lHhxxMDPqIm3ENHlt
         A6JGRbUvNwaovhU7zLZha04EvA9eyaxsJWS7wwJaeJZvy/B/MwBcjtla+2fd2C7q55xg
         Msaw==
X-Gm-Message-State: AOJu0Yx5xsT7Oht9pLaAqNqu8AiQi0b4N0j1isbaQK8L2nQonpNwytXI
	4n715UnoJH7FUhdlnfNZspuBL6Kn65iimhq8nYsW8hgwJAg3xwfAIxBNDeBrhBp+WjTT5mqSm0X
	xkUZmZRzqNlk155D/YABj68CO0pbw7D+dKdyGlFQr9Etk4lQIEPFs68bT+BCGk1g=
X-Gm-Gg: AR+sD11vSrSGfw6dcARQACjIdoG30R98CLca/1RcD0laXFFFF8oiH0t5uErBZ1fkXma
	6+4kgCuSSsk0FY+o2CY+kT0wsnMOUNXJi+tmZBs2HCTktIuGu6yFBM5hYIsPfkrlv1azhuId+54
	9kDIPYrHDjcdNRKwL2sGPaJVfV3ybFBH6kgw8DyQsvOtf25SHkw91mKDAmVwkoi6VS7LZxDcfoX
	4xemc7VlTiJyM2lY998L0AkGDQ7nMKmd0kMOLiJgH74b93hIowgH+qd3ix+W2S49uIGqKaFyCnm
	YV6p1LC9y8yHtUYYUGNp4tKGv8kQncI8GXgsr2TAIkfOq0NriUqRmpIIF/baNsWlCgb7Bc+TdMX
	T4R1axrAFM2c++MyQqi8kK8JuRRjm
X-Received: by 2002:a05:6820:2d05:b0:6b0:b196:99ba with SMTP id 006d021491bc7-6b13c5a269fmr12788651eaf.17.1787237453649;
        Thu, 20 Aug 2026 07:50:53 -0700 (PDT)
X-Received: by 2002:a05:6820:2d05:b0:6b0:b196:99ba with SMTP id 006d021491bc7-6b13c5a269fmr12788608eaf.17.1787237453282;
        Thu, 20 Aug 2026 07:50:53 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:52 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
Date: Thu, 20 Aug 2026 20:17:37 +0530
Message-ID: <20260820145036.2035641-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pRacJtvcjS9ojos3UcojC0itbl1ZkaLv
X-Proofpoint-ORIG-GUID: pRacJtvcjS9ojos3UcojC0itbl1ZkaLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX3ZL6YLgWYBgN
 xsxsdivNTqo0/UdnjNRUIpDDDoVSUa26Sbd17n4PkDqizRDz90FpJXDZGiVDuyvSwTCoOzDu320
 MsHoKL1afTjwV4VCDpeG4NBBZDBlbPlMlELwpoUpnrNft7C0bEpEaOVVuZzynJgzWROIRVvCeIp
 PSFhkqutCSgfXqT4bLXQWAGclqHjauGB9DJbYORMcZ5YT13AwiWfS5IJgpqN1gqY/8txYT1UMvf
 5XaEUMOuIqdgmtr5WefLkqyK42XMKzwfwxPYuExZfEFkZiVbgtFnOKYziqbOCOHp8U1nyv3LBiW
 0/hEhUsMUVcCH48l/fT7fMS4VyyavHg+cpMi+6HkbfWJhO5hb7JhEtaBvkhj/X0lihpbFZAlnAU
 arymj29GBqTdVqiFDf7u7LpFoHVfvs0qhtQQuXLm5A/8CyVDYvPzT+beWnn6OqNkXFJL2vffuSn
 cyARXHNe9vIe4HuEqng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX8uMIeXKfg7T9
 E/wadllqKAAiJi4oXz9ir7qC1XV96SSLxRuCiQxvKzWVMFi+EXqCm/KSNqaoZng6wq9XdsfemtT
 IFKHQ6si4VlvgqACem575jUre0zZWNo=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a87144e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5ttfkXOUkHmYICtgt44A:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

Add cypd6129 and cypd6229 compatible strings to the of_device_id
match table so the driver binds to boards describing these Cypress
PD controllers in their device tree. No other driver changes are
needed since the chip is accessed through the same generic UCSI/HPI
I2C register protocol as the existing cypd4226 support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index d46ca942026e..37b96d662e59 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1527,6 +1527,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0


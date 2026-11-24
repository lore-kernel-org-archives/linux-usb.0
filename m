Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510403;
	b=ojLDsR7skFr8bBUx+EMnvJ8tF28KveBgJWr6saxUN/Gdky+RY4VZ+rXeVO5BXnfYUmKv
	 ZpdVOyS6MWWng0PGbzwPElN97NQiPxLNYoNnS4bqFOhJsRLor7iRsIxYL5yOTNm0a8k52
	 amUQtZDPoz5QSxBnGwCPRNX2XiurN84z+3mEcguwFf0wzdd0hsR70gu7apxbXuszpdS1W
	 T7y/2/Hsxe2VDzjd+JO9yk59vcXoUtb7E0iscepQvJ6TF+P2Orz2RSAjvNVnHi2VJUSyy
	 nSy37c1tEGJMSirMRUgqPf1iJl7YsAcvDPkajFhAMPohaCWqsj6B5Vr5FSNHYJhIIzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
	b=oA9kcbYvhZuYm5EjcPbJ80yhYXEjG0kNwEJafDe1WmhhZJQGpKNzpVhK0fcWtXPoEV6R
	 yIfQiwLeiA3qjEKqRV0HMy851xvZ9QR7YSgpuJye/p+UHFfvuJ5HxOa/QirrQsvsvXJbD
	 bkow6lheThMZAmpWz2WJqJP1HSGtQYzpSqPBPIysKQqRVs+/unF9TUGLLAvjr94QFsg0K
	 CbLoAfL9G8pEjazT/ofz8t63qJjDeg1Ww2qcnqk3QihPRWXnd96AiccCQhvahZxO58qpy
	 GyvhIeL189brCtAnnr0AE5sN1O1EU9e4zRuBfYiV8GgdWMrKdMp24zesS15AH+LgYBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDkerN3T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lnsva30w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD6606A6B7
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BD6606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDkerN3T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lnsva30w
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Euto016816
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=; b=aDkerN3TbfPjXjBs
	ym+aRZ2ea7amf2Go3ROmVp5dfToS3QkquGPKRqXNLaQ1yA+Gq5chlIq2XQY78KbV
	7B4zkMfEWsASMTzmG5E3DxS7PueaQKyxCXiEOW7oUgWmYJi9hfcB8ZW22LXlMZgJ
	P7Bcxzu8cYhNLfShYPvpTXc/l3S4JYyPqO48Rd2j3jQF1NpXhmmrzhTNNzWcqV7m
	aaAzMlDEKWSbgAzwMsRrosGRa3Nzc2BR9hPDDg0BI1iOxIzIZs5j8nreHTPVx+Mx
	A1sa5KOp5J4eLWW3HWqcettQbfRyVv4rOTBYs+xB230xzcpK1VuFMW7rtXFVcE9c
	OcAGDg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9ntu7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 08:53:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3acec6613so205709c88.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 00:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510400; x=1796115200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
        b=Lnsva30wG2iulzCy9ZNlgePzu96AmFbNs9t003s73J5EuSeEuorc+kNLTbx/iEZ76V
         OaTb5HM2pH+wCpmOTqOEbGV3NPO4/yrGBSvGiCLkkrkXKMb/ocj+cxeXfUe4CE6pTS5N
         2d6zfduxbRuZSsaMXkH4OqCRJJi0i5GLpFAAwHDx2MA1te/aPgEJ/rLxd95Vp8UDLtst
         goVOFyez1Wb7yapMR0O8s4vd5hZP8NeH3Jj1U3L2s4Fe9OHeugWcC0AF4BP+UIVrZDHL
         B4HJfO1p6MFq9YtUEvzVxqy+YZoanDAoFdU7lIYn8Of/O2EWRDcLDwrs/mTEAd7GN+2T
         cWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510400; x=1796115200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
        b=ibnqYDLMaDIKFDAwnxq/p+syLGFeeWzxzFo/IBaUm6kKuCqDcf3+pbwUsgJ6hNx1wg
         Je18G7xIDBSHoP/PXIXunxi8hKJZ3XiVVPpzn8L9l42DqO1NEr1cu/FG/mgxIm05fCK1
         /kkUo9GzS0kg5RT2ekjJLh/HiqDUSbeLvFJNGOJuGO7DAHUfhIOJJ2WmGiHb/eZvgEs7
         Icf0Pzduk8V69SNGMbaEiZlEDH59vRvjWwsxAWVs2p/ujnQsrdlH/KWAB9RPXjj5YrZM
         2SgBPZo0ZfcYQsPh4cul/TwJgMx/7S0ttf8YmQ4qoHf9H4CK/irnFcDo2TNkpiwaIaPR
         oQOw==
X-Gm-Message-State: APuU4Z8AVaGrM7s/Op0ko7FlLtXpYhQUkvKS3+uQcurOAGnc3V4gKsJ9
	8Myh48rdIo45khU6pE8qHkHnJJrQ4D/YcsNDzkfnbPpEdAYW/7k0mINs/2sZz8wXqb95JoE6+ZX
	kuhb5fBdpoXXj0e+seIYUWKA6NyWDd+rxl8oYaaW5lK/V8cK99UbeRg+fr3xrKcs=
X-Gm-Gg: AZFdTZdCRuHdFPJflrbh/0sX5jYmMP3H1vAQ2vnuRZUtQwbgIvR46MatIYOyPDoCA9O
	CE8PGTPaiIabMyKwfc8SB8yQk3I3H/WV7jc7Ds3EtgSL4fD4xEA6HlPDrxKQjCU211elfCStj3N
	+/00M/mvdJ0p11NZ7lVuZzsQdE0J/PyOfkJ/p6xdyZWre7xOm8OABhFUW0ia3mFJNOb8WZLb2/f
	1dmXflRvD4fQGkh4ro15lvQeK9CdblZwZxpRQdB5ftn9nMBAVmyEu4pHXc4DoqglpFYi7rz4rlK
	JEFp60OSUacmaGWdHuY7YPqaW/QV0aiZYzw0xKRiG/7IfwOH9XhSQMoXX2ewJ1G32waeLQZrCwj
	ms7Z1pcmksJH2dyN/osTAtkna0n7+17eKBH5xaLZxbTT90vz6DCWp06A+gm/1xT2WTZTzNJ9AoH
	vG0g==
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr15110415c88.20.1795510400299;
        Tue, 24 Nov 2026 00:53:20 -0800 (PST)
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr15110391c88.20.1795510399729;
        Tue, 24 Nov 2026 00:53:19 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:19 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:06 +0530
Subject: [PATCH v3 2/4] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF
 device IDs
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-2-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX2BCtbKBNk4S/
 KtL894tWDgeo7h5PWuVjvF6OBNK8bj2O6LAss+R53t3Qd1kz/mjv/YetnQfR5jSCRSngCdtnH3w
 Qp+YuexX8Bt6AasZDlz3RZOuGbCu3/xEsOK/S7yA6AjrXCg2hmMlN0HChZyFGH5Nne4C7oaF1kL
 Fu7zlT4rZriE8DDwGy5CvyLSv7ujMvQ/tGEXOm7qVSGsoxjGTiNQTEygOB/GJkvDMw0Ec6Wl6co
 uCYFuWfWU7D7lDQEAhWASMclLAd0tLWapJTC3Mp3LUK6pvAP3+lQf6tEVxGtytW5J9S4GeT4Szv
 TkRsKkuIQKDYcontDki+Ji4hdoeOe2V/JzOvJny9to+PdhNBA0jP7OLQdRYHoBnX5w5DJFBk56d
 c9C774BmuG+3/pN9KUwQPkWhA0/ZVzVd3CXJNK1eBEONi2EGI9+4HLKm+rVOoCYPmucMEa+6ITT
 uU/gRMGOd7ialwzM+4w==
X-Proofpoint-GUID: QpXtuc9pvJSzVfi63rVuHWDTMXL6-M86
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b055081 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=nKNncH1Eii2HH4qo_fQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: QpXtuc9pvJSzVfi63rVuHWDTMXL6-M86
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX9hYxxqI241C8
 VYChRRt+4XdMtiQ8syQ17q5KG1PQczrcu63OUx6RCkKpJqJwI6+TcA7TYw0+uAP9oa5/FOaaZFQ
 qT1xUG8iahO4rn4feCGJKSRx1+FXcWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

From: Akash Kumar <akakum@qti.qualcomm.com>

Add compatible strings for the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers to the of_device_id match table, matching the
corresponding dt-bindings update.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 96d0557a862d..c560d4539302 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1556,6 +1556,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);

-- 
2.43.0


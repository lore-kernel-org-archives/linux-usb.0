Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CB479892
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308036; cv=none; b=sc+JTDgdp71yqXkhczgIRSEcUZ1N1S81v/5KqYn+cTbJzClRnmEp4KpFFfP1pqmqPo01r60mtwmuQ4Ozs9YPZ9irIYLeNjO3p7/l2dQjdQOC/L0txlLoue7j70I7+3ZjTrbriWgm2U0tcxFlXrpr658kky7kHOFNIORX+tDaJKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308036; c=relaxed/simple;
	bh=c/DbwxB00h4bCHsVWfXDLZ7vX3Lz9v0Rhy2xTpHLGyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjmdD9CFA4vZRGdrDuyPf2xu/VSuwdF27Y+kVNwd9aV37fY48B9tmg3QSYB7QHh0ztPsMmjXtKZOmWWGVDgx3TOdj19X6aIuySTZOj5QtTZ8lyhWedq8nP8F4lchUUnL/E/LV7E5z7ndz3HqMWASK608fRADX0ZDjax3X3usy8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdZa/j+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEl7ckNe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdZa/j+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEl7ckNe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LwgH2006112
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 10:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=; b=KdZa/j+VUlduQbgU
	Zz3x6FaKzMaOOdoIkdDtjiXS/fGhlNBVOh5KBSuvbImhBxZnMvnuf8tG17XD6mnV
	NLKfzkCC93MYoWo4Z4KBuxpLwN0U//7E67qExENxBm54HxUrBT0MtzUa245fxZtL
	6zvmxRIE9Fvnkdt1M748tLbGZvIOxDZb5eOKsmR7pLh4syHopCwI2d7kTFG4qKZ/
	iUXWE4VF+88YHidXtfvBt7rp3p/sJmCcE6WbvDNzQjLhwBo5V7VE1HPWOAZ2vz1l
	U/XqR2jbg0JcTEytowGLDFFGZB8EnC0zCbxMQop3fDRfep9EihIp48wks0T4D1wr
	wau7uQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddh3na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 10:27:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1180152a91.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 03:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308028; x=1787912828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=DEl7ckNe1GeyEcYCDpSf6ozJrIw2B7gAiLjMC2R2x2rRYazdXTVIM7cJr6ZXH42QZi
         zRQ/iOuI6GaSuG2ceZ4BHEYJAeecQqJVV1k06EWlGAwFUdh8gJZ/7LBeaPgFF4+A8x8r
         viuKIugHKTPMigFvVM9HsFxSVhZiQ4cThOkZcPoOfTF58PcPt51XbqfiZTKDsl0JKnIH
         wDfyruhggPqZw4OqDhDQQHxlZBJbo6e0t/N+qDa+5X7C70Ol9whxZPYGxeKZq8ibPy6i
         UBfN+308jwGnL5NUdYSGL08+Bv2pDw2lTqkpz9Zg7SJn23OnHbJRlvjKvpGgCzek2ez1
         uy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308028; x=1787912828;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HrdxRoYGRQbjflFJ3A7J0xX/OJgxy1T8MiL9djGGAXo=;
        b=SmMMelUr8C/fIBLUsyAa5Ihcw9wKEmYoCPk+Ww3dwbfQ8d3Ff9RB7bd5Bb5ivqLMDe
         rCNuFdc2AFO4Gp1zDUdrOZjszs3Wxak6qLspeA0GyfiyKlx0gPxCydoXoI6r5db1lIa/
         tXvWrAdtzGBEElFwxs/3yf2rYJrt2bIEGUFNpMYyHEe1SwTwTSzQTGZDrIVvFkAylC4e
         8mSbVYJsrlYZMgtyFVvqJui2DprEERnXRYmGi9uxUT+zR4xW4m1as3LYA+1DESCOowNk
         CS/u1wRb8DVCI9w1Hash/QfOeQI+KLiUgYjuiHD/cMcBtaXeQ9iQLjL04uktulhxotMa
         fTmg==
X-Gm-Message-State: AFuF++lSDfXQMqKeovq396fgf36HcFOmxCQEN6udB63OvNymMImuIEWw
	7I8Hv8ZUNPPy0FVwr96Jk6k0iTC2OEYnE938MDraB1ECdxazvUawFWBpFLQmJ9XlXjWyECSm76c
	/omB1EC6zk/ZGPWEiwKiIvkzVlYnaNnIRyCjOxJrIYvF+nd8UM7DrCKYLYMqPVFk=
X-Gm-Gg: AR+sD10M9PaXL31wIspfRzQT2MbpvYiZrzCCziiaBHPe3nRidR/U+Oxgy5tOcdp9dR5
	JbMybO2jFLwTt25ajB8SCNiPya1OnuTZBkcpQw8cJuZTrXjzVDBBIeo3RITrZEZZg3TsQEdfpSj
	KFAu1vwZt+QWf7sefJy5e7BnW9qcqHbUBUhBNo5cbeQacr3AAG+JJ2S5eLEUCBEoZ+BaFIgFK97
	aYtdB9lwQGQdKc8B2qVymAcAgr0mJnZZmZiI88ulD5e/ugSrgkAaQVxpqo7O1NpjsulRbGa6dHQ
	OcjXGVrEGvbDfe1M2/WZlJ+Ort/LBaDPIR4GDj886DXdBQEFxCD7PS5as6g5+6sTWDaaR09k526
	myn+ryYVkdjopSu+SM0BoDM/4pHRx
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr10171036a91.14.1787308027954;
        Fri, 21 Aug 2026 03:27:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2d91:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-395c39cd288mr10170929a91.14.1787308027474;
        Fri, 21 Aug 2026 03:27:07 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm25859682eec.25.2026.08.21.03.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:27:07 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
Date: Fri, 21 Aug 2026 15:56:51 +0530
Message-ID: <20260821-shikra-usb-dt-v7-apply-v2-2-030647f06285@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX+5hojgeCxaXY
 wQmYqeF7OW3rUC2zujmyHrpyRw32m7suafOboF4Dp3XX898YKdvwDxhU3lLiveyS+huHzG9DEm9
 5dJLX2OfMp3mrP9nSYJYYL70zpxRveY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfXxQPZjhWhTYIr
 6+u9ZjD7Y6ZuccVbypkXkUOcRNv+HAF2AoI+djkgD6qaKvctvFr5EJYlRqzrZyZu6D/v4OlCP+o
 dlmhVnWoPSKTOUsDU4s978qOGxs5vze8dvRLda92uGWZ+vy41Zd5VUrOKqG7mtvtq4GcA2kKiSD
 WbjnQtzz3pnhlRMpwfDX3Q8lzUEiNgLNwSOO/TIwaLaqUcp1QWp0XocTdreUbBpPdVItk+Vk7Cw
 n4WKRF1eZCT8VPViI+Lemz2PK1lBtLXPnXSN9T586b4FibaHTwlhSF5ErqeXsWAhar5PMYY+/Pl
 iUhPLxoiYSKeSQ0tlWpSNOg5QgZGNCnr9tM4OJtgDceedUSZfrfeg7SuQCAdqh4w15ze3W4dka1
 eGv5dqwtnJy2m6KP+VEmtzVjf6JGwRoaIRIlMqMf7HCsilW3cwkxUX4kvgr6JJOYjvltfVFKOtf
 TNB9lPzKecF8bxefDDA==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a8827fc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5ttfkXOUkHmYICtgt44A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: c11rKIO2eXoDdbqkyiBzpAWH9Ht13RnF
X-Proofpoint-ORIG-GUID: c11rKIO2eXoDdbqkyiBzpAWH9Ht13RnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

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

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542428;
	b=bhaHibyHd8LHbeW0/XWjK7M6OatqM1fLdEmO/S0d43f7k/FyB/E+UBRz145zcAqW02YH
	 HKmndZYzovUz4pMzho6U1p2iPUaopIShT4Ip2WX+aiWkRFKLNzcuRkUBIeVzOPpgOWc3k
	 TQ7kPKdPLHaULHmfLWZHMntelTmMmUy7odA+s1+L0LuByaKJQ4ON+Lg+WXpXYHsOXUy9Y
	 jwyqop0Yrn3UaAsox7j5O2kUKn1trUY7LVPfQn3zrj1x84WRlvHFIj2dBl0BCjhsyBpAK
	 7Q33bab4JuxrBNHLD8AL8IVzD4LBCUya3RgJgqahRurLLF7ForI3o7SFUDji6L3qElg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
	b=L0GEdT30lhZvsDSwh4IRMBxjsLqvjX6iHu/afNQE1BLweBi5NczY4vsWNiORNBjCayPX
	 UP2ppKHxQrTyt5m1qebu5dzOO9dXRZIUvK4nL2elIjo1yEv08dCF2TCpDxAKCWP/5Wc4I
	 7MHCBM/lBK0RpYYQIpYw5CkRpaAgxGViX28IG9xY+d2BetSijpM9IP4VBF1BCrz7NgHLG
	 BMfD7AmQ1HUD84J4JzHF6MsPGPkWWA58tYDYzUuw0iXAH1CwzfGir5d4QJ6I16OHOv8Pe
	 oiT+4NSPugEu9jKiVsilvrfi81rKcRV9v2K7bAGXKVNIFtyUEtqnXgn79fUz3kNGoKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UINICc8M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6eVoHYK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C96F606A332
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C96F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UINICc8M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6eVoHYK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOGsCnS1541971
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=; b=UINICc8MB9+vIMQd
	lVKCF/c3qjM6TUI0tUcjZM2g+4tG4ePuaCffiUwd2w5fTukvnHCVWRY1XFRbl5Lw
	vYZvYxZYiXt7dlqRm2e6CdYi2wIHufYdsw08oArIU30+hnKspDTxaizR5RlmX/CA
	cIw3yVhJ9rOCesYjPj+GaIzSlVx0UVyMB4Mp/bIWXkRDxzvUV4Quds+oGHBEGNt2
	uIeWHm6EJPRH2oBdp+dE4HCoR9YUx8naV/ckVSBSoEB0a1h395ek5MdKUlMCf5KM
	D9KLSXGDCl/E9ckaKNttzCuMk2gNTbVn4/f2cqzTnH5hYTY2aJDIN2uNETKH8+1M
	Ag5E0g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs89qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:47:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edfbb5b812so1702556e0c.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542426; x=1796147226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
        b=X6eVoHYKuV87L/VEe/nc6LMahe7Lp7iJyvY0RPGFOxygAHNL46+/SEt34YtRGWbXMz
         Lbx/Gpf8UEc9PIjg6LAuSmXEZSu/MkCgE9woGjiEBIxYcfrLlnMZ8ZwEhi5pRBIJCWZI
         XqsrXKiOneu9cOBy/v1xj/o5nFCPetJvsaMOPVko+BxrxpRGq4dnPymNkfDshYKJDS/3
         VjczXaGQ4r82NEnzIaPjUsqhJCiTWhrZHZnCnIBv0fReXYc1xxvrkRycWjyahnboPZQy
         seELReES/qriOdH3zTw+MKYe3GapfNKzrP5bGy1d+bIehTEYRd1wAE3kKw4VSyEi0clb
         BBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542426; x=1796147226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcXA9xwayA+a+PdDfHhtNaUHIDytugzKoBG6+yD41s0=;
        b=rcK0986GNMMoaQLP3yPAUGBRMyIYnPwLsR4n8ob9x7RVjrFtCdSWmWRj7MSpYpqraO
         ehYS1ufL3nxjuxBU+i7ymb53tNIqmZyl85VimnZO1gd4kcXFAzZb0n9DqJqUFVlCepRR
         0Hxt2sZykJEebP6W001dLpwV1JWfHXHFWIcwQd52E+IxVFt+vJch9/9bjk2Y1HhFSUBf
         zyA5uW1+Jvul0Cbc4h/ISnFVlr/9/X7mEZAOEUdIwjx3tuNT/Dhau+B3wuUk9ja56lqY
         h8esu4BRzXjQBhVIa6hRdlh72phIFkEvtxFcyhyIrwpGepd2WsT/FFCOYdWtadr8ij0i
         CxQQ==
X-Forwarded-Encrypted: i=1; AL+hErFCFRIjrrU8nOV5H/PhPtfQHGn69SySgiAj7UjzhdIp0SQqasVPXdyC5WgoTlo8zbjIyDwDLxpe+6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kkhD21w+inAhUx99xmoCVs0cd/3cMsBsRSI3iDRQJX4Fm+fIH
	+GWWdEBBUHYG9T/1llptIokzRYk5gm1TgWhsFgV2WZNZY9TzVDM3wxfywgbXryTAthEhxnovOen
	xijk4Qn7EqCkbqJERTKuf2eCCNxK08yhNAiuRz4rxZ64odtG8sR3SGW5cnc0c6+OvfP1WbaA=
X-Gm-Gg: AZFdTZeZMqS57kKKGNZJpT1V0gunDLJ4YuwqXUdvO31vhkC6p9zESXy5bfcW7ZKWy9H
	cXS942rXyy4eWB76AtQj347bqI1tP5Cdt0btFfak3RckKpMN72jeAdbpHFNW6HClXX7Px2l5Dtk
	U/5N8FIZ4c7DnwnQCJ5bYiJflGsNraR6CLV2cGv6bHNBMXw+65VBwV9OOH4GRbX+h5MoAO2VXVb
	MyyuuPD0F8cASBwH8ton998Fkzip0s5h1RvDgVC5tPDqi3OsZuGaxP2eCtgG2Mg6+lzWwgErpeY
	fmAlv3VIZOsyJdvGDQXG52ZuTkQoAPw2UbnNaS9Rjpm1IU9qobzY+XM+lqY8T8DzBzrvVj9Vj2l
	/qJAuup6OQCRVgVhlPzY3+fvSUt9i85+7/fZJ4lIWGcBzwha+aZm3IhFreN56cqJ+SsFCtHkrrY
	UsDYJULiYh3uxj
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ee8af79c4emr7196728e0c.23.1795542425863;
        Tue, 24 Nov 2026 09:47:05 -0800 (PST)
X-Received: by 2002:a05:6122:1352:b0:5ea:d1c4:7cbe with SMTP id 71dfb90a1353d-5ee8af79c4emr7196706e0c.23.1795542425373;
        Tue, 24 Nov 2026 09:47:05 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm7396418a12.20.2026.11.24.09.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:47:04 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:46:50 +0100
Subject: [PATCH v3 1/2] usb: misc: qcom_eud: clear the enabled state on
 disable
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
Message-Id: <20261124-qcm2290-eud-v3-1-4f31aef8c1c3@oss.qualcomm.com>
References: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX4nlovDYyXOmU
 hKxMVJVyWwn9H0U2iJnUqLy+NEcDPUeeZNnsDVkRI2RpPFAnFm0IdKMYXEojn7g0Uf4bRxBDO0S
 M7h4eEaSoqZB1h+FAg7OkJCFnWh8W74Aj6CEaWratO5ZmH+AIMENFX1bFQq3/tHreY38OQOxbv2
 3+Pj22kVAtrGVzE9HyZ9vtTaQGbl0+vJNXAdX5LdoPT5XWCSNBYPFbkjEajmRL5Pf+g/YVRiw4W
 A7pJr5mvsd6jvTdyfZ841Efd3dhahL2cGuwZ9NsXDZtwdsCilLNwtpNExyQ80/pSIMFY6PAgTJ1
 on9kkPqsEY9ipR09s0QVb/Jka+RC8rw4bFR/s/qGfCsYtLv7cCfVfHaJBmI2tdfnsPkKjN/s7nt
 OHyxQxjVlqnmSwziPszx7TlczRrXl8lvzVCodpxEhZLvvEGpgavSt0NsEXMQZUz1O4hT2tnxYRE
 vbIRpGjJBcbCrVXZCIA==
X-Proofpoint-GUID: BkzUPmGUfeCx2h-sTpw1ZUJ65hCSpa-n
X-Proofpoint-ORIG-GUID: BkzUPmGUfeCx2h-sTpw1ZUJ65hCSpa-n
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b05cd9a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-IlMunDoKa5HfhwsZc4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX1TraOtyhLMK/
 jPByjLGdebiHtgusB/6mpaRebdcFkvtFv7CL1ciDfGZnv6qMgia/IwIowv+C6mgcL/CkTpZkE7C
 UiDFQoBAXe/nWSTbA5RFV6VlH9rmtFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240069

enable_store() sets chip->enabled when the EUD is enabled but never
clears it. After a disable the "enable" attribute keeps reading 1, and
eud_remove() disables the EUD once more.

Clear it when disable_eud() succeeds.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..6743a1c7d717 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -97,6 +97,8 @@ static ssize_t enable_store(struct device *dev,
 
 	} else {
 		ret = disable_eud(chip);
+		if (!ret)
+			chip->enabled = false;
 	}
 
 	return ret < 0 ? ret : count;

-- 
2.53.0


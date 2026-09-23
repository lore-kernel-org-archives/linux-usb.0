Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D013D6690
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152704; cv=none; b=f+vI69nw1gLcbsAX9uv2StP45bHmn30OrcB+Vl/CT9rnpS9PY0AXpRFAbtij8YSYRV4uwx7cPBZMSn90GtBPi0QVkEtk1e9yzkg/ul7RELw3xLdmCpsGh92nEiUlLeO+mNeRy8xZNQ3UHn7ZMn1JP8GLkAk7Q5Vu4aP/lCGpUU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152704; c=relaxed/simple;
	bh=yyO1TjjuZ73WiNg4/ZkbI22ApDsMSWGk15dUuD4XbsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOHMdHnsLTAEu1m1T/T12E2bK8yYfy26gKYdRpnn7/FeTbFu5J209a93mJc4R0Im+zFy8lyXCp0QOrwoEHEge9JGnNdVOiUT03pJCnAOj8cX8WiPellyXf79jvm99n7TmeBHC0mqxAJD7dFrkxCquHsqK1GU7rxs8jz3LM89JXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtxTY3Lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhn2gsns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtxTY3Lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhn2gsns"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JjvH3332983
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cDb0sGso1ETTrzZaYUFiyqOj
	3EvRajpbPDzXFX1BXvU=; b=gtxTY3Lgmo0J0t3fEs82mwgejpRgmqwLUASBH8J4
	Ki5McU9Wa1putLIOnCfeR2umYGTLZ6dtjd1ldPWAKWKVn0+w/voJ4XwJk9Nk10sf
	W9KLmbiD0eHslzVSQMR3TXdKVYrNK/iPV72ioqmV9QIMX3dFcY7fUPWfIogvp95O
	tFEn/ctHVnLWvtBvr/G0nS28K6k4pyyo280LToKcJaaM2dqRv6X8Wt30Wd9A/h53
	oBufjpMbb6PvGqZVBOyfmUhbDS8DKbmYehYdOogamQvaZ+8nS5ZNkAlFHv6jhukm
	O1op1TidfRMkeIimSZA9w9fkPzmjcp4o89brDadfG0SZ2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuded-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:38:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so68297085a.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 01:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152685; x=1790757485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDb0sGso1ETTrzZaYUFiyqOj3EvRajpbPDzXFX1BXvU=;
        b=Zhn2gsnsHhS6Nzv8y+/c+rW3oWJCtPmHGsG1mtV3+NptTYpprjv2hshm/SfvNImBGJ
         d0EwYgTxKifE0H9DtIrN3yP5751Y8dBuII1gU0e5t/p6yR7RwM/K9KjYk4EXcqTxLm1i
         9NcjIFiHXY454YqxV0nSlunE7Tg2O1Suc+vZLodVqM3blUUIkEJkXCsOwA4jhegtBNnN
         O7M30ltE9K9UIKucvWnJbXpM4kYqGnFTOFM4YKwpy4smpoEFV0OFVb5MxzT2fHKXKp9k
         haiaDJQQ5jxZkGQiQVCDfCm2Pmdn8JqBNFc8VzIgSWy5FaxvQRV8pfEOaYvkzcKSMzv4
         rlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152685; x=1790757485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDb0sGso1ETTrzZaYUFiyqOj3EvRajpbPDzXFX1BXvU=;
        b=Xqdh76RC/3OiW8IcPbCvtAWmu3wIfijfYqBimSQSuRZrgbt56Ez7IYSGEOg3rn+G7V
         +Fbo9rhb/GAc0KqXOg6G5vponsg9crNlPlJcp8OvQb1yHj1KKzXnCQ3MBxQcbWQRjpmm
         xKWYxDM+dp8doLWDxoaHGWhBeGGneHm+QvlKARUDdEGJ2FNv2/h6J4bqabllAWbp3Tek
         i3aOnooqXxEvmwm5Xin2Vf2JshB6PqzSAF8hRdd3fgO6WkMlt4amxekX/EHinOrT4mdJ
         hZan+y56U/kT5L1UqFNdXroR7gWnKiAFWzylxdsG24R8u/VmHI5VEgexB4EZ87dYdn0Z
         NNqw==
X-Forwarded-Encrypted: i=1; AKwUvBwLZ0F93nfSOT7OtFkc9+4plPP54BQi08gepJ0sEc15TEvNq1/IBy3tRJ7u2uZMuOpk/m/HoIEHRyk=@vger.kernel.org
X-Gm-Message-State: AFuF++m45jikt1nldEa66VeHKeN9Jt4h+0/S2IvbrNL/hY/XbcyboPAI
	rma2DTq8wKSX2hT6gKJ6K9w2XCcGOQaCiOkqqTELJW9+2hLxIcYvi6s9TWV8Eu09WNeRno7sZGN
	V7hzt3704T9g08cRtevhenFuS5HjjXq/XOdhZz0hRcK1o6yy//Ei+yc5+V2REqSo=
X-Gm-Gg: AYBFou3NGRPhLsRm0YRyPCBnKgn12TwfK1ghP1IZDhRHcgHrf+0Bpq9vJoRYVJkWAQY
	Gf4N0gd/FW7DKWcOQbTG6Dgu04bp3qMpMrFDCp7JAfHuM4XyQr3xipxPgYd7zXIx79dxMSgy+K5
	Ui0V6FTAdppw1w+WFt3EK+RZ33sHeo9ELxP31mbZ0lgfmOCjUgMKQ9VosdN+NkR5w+lol11n5Cp
	3nxdJYdCdtx2A7AmFd/MA/fO9JbHeCP/meYEs9dmxVQS3M5BKZ0xV3w3YhlpkkygZ+SOr0kdkUJ
	xwxA1PnJwvkrnZdBYe0kje0f01g+7fWrJDrxj/4CIl0vuW8vPoMKuaSY1knEIKsNeoeGz9EmAqL
	Le6kXfg6BlCCn582LaeWK4pKWuF95oWgJM0Qdjk8qHfm0W8VOpUBHGF5zhnvoBjWUh+lu9m/l47
	zDfMQW8n1N5Fhg
X-Received: by 2002:a05:620a:4054:b0:93b:c581:2e16 with SMTP id af79cd13be357-93c250cdf90mr298720785a.30.1790152685347;
        Wed, 23 Sep 2026 01:38:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:93b:c581:2e16 with SMTP id af79cd13be357-93c250cdf90mr298718685a.30.1790152684724;
        Wed, 23 Sep 2026 01:38:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859652esm418457e87.83.2026.09.23.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:38:03 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:38:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Song Li <songl@zju.edu.cn>
Subject: Re: [PATCH] usb: typec: ucsi: yoga-c630: unregister EC notifier
 before UCSI teardown
Message-ID: <z7v6erddxh2ydm63xavvfb3sckvwsaruife4bz3r7cpwmyg65r@j44ta55rkcgg>
References: <20260923074828.489562-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923074828.489562-1-fanwu01@zju.edu.cn>
X-Proofpoint-GUID: 7pAuC3FosAg7C_H1kKTqufDNeggzGJ55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXx/u1GIF0TbNZ
 6VADQCpNgl8Orlz4uMqCtzogpPdpgvO5rfhaoUadGRtEKq41anlF6aGXLbPbT6zyWCtm3tOGkpe
 Pd9S1KplvhNYwfCaipJm21Di1mqgW9bami5X+CFcdh4rzhF4JwwcyZfUefAaBBIG9GFBwCvps9z
 ZdGy8zomi+qPefahE9U/x07w5wHSnFkhljSJJ5bUG1dwdq027b3s2SO2xQ8uuvg+JMtaAUuzVio
 k9AGxzcXkeFkZri4mKXudoZxUn2gaX4RfxvNv9PIx5tTzZWVYHc51fZttFJ/CseA8kXYlgEZYSL
 wQx1pyQPcREntkjuoIAgv/4ZT/2gXyLHZCWRumEeRE8so5mhn+t/qjrc0LPUNEui24UcytxmsP/
 XTdKky+n65avRWpAcTlknkGEuNOcxuu2N+OYHBo1rT0Dux0PaM41U2MNjTu/s6gn73Gru1sVM06
 fdVb2oC8i/CeT6pXzlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXxerOmgDH3de2
 943O1MUmf3kjXNLUkEPRb8tnhlJsgxXspfac1oJWRbAWAo9QlrD1LEmGfolHkZQvC84zbzNLdlC
 u8PDLRL5/JsTfpUTqn7zGoawDGppbyI=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab38fef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pIWJAyJa_h66JnIjfXsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7pAuC3FosAg7C_H1kKTqufDNeggzGJ55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

On Wed, Sep 23, 2026 at 07:48:28AM +0000, Fan Wu wrote:
> Both yoga_c630_ucsi_remove() and the probe error path call
> ucsi_unregister() while the EC notifier is still registered.
> ucsi_unregister() frees the connector array, so an EC event (USB, HPD or
> UCSI) arriving before yoga_c630_ec_unregister_notify() makes
> yoga_c630_ucsi_notify() run on freed memory: typec_set_orientation() on the
> freed port and ucsi_connector_change() queuing work in the freed connector
> array. USB and HPD events do not depend on the UCSI notification-enable
> state, so the disable command ucsi_unregister() sends to the EC does not
> close this window.
> 
> Fix this by unregistering the EC notifier before ucsi_unregister() in both
> paths, restoring the teardown ordering from before the error and remove
> paths were reworked. blocking_notifier_chain_unregister() waits for a
> running callback, so once it returns the EC interrupt thread can no longer
> reach the UCSI instance and ucsi_unregister() can tear the connectors down
> undisturbed.
> 
> The callback is also the only external source that requeues the connector
> work, so the cancel_work_sync() calls in ucsi_unregister() can no longer
> race with a new connector-change event.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: 168c3896f32e ("usb: typec: ucsi: yoga-c630: fix error and remove paths")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

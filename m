Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7A4FDE52
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565600; cv=none; b=eFrw4bJ7mh8ogGbUhWxsQ7Aqq4/ylIJl+vyWKPrIt6+ybn9IbUzYI/WBYSe0t72JRRlv/hQiW+EpKW6t7i/mqrsRuVr3ETb/MyD/RQ8kJwFnAPzWaQ7OkcTY/4ke9bvYABLiahJkz8PiLycxRLITypBp1xiEILISao+HaM9PadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565600; c=relaxed/simple;
	bh=pSG/TrwXhQ2SDtoVxMKdzFoXta17jnhiWAGC9pF1ycE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mldnL63jh9XHOsUnR/6M7RBznZ72QOMvGbj0czUoamDqEeceU7y+IByHlOjXU3CUyS/iqVr12s6tPrUoauklBAKwU+JExf085f8LmMgVmUdNET2BXMHYHn7lSaz6TPeIDkL44wQW+KP1CEDMpOkhA3rIF1wnopNXTzORrpY+8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+LUSMrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IajFUMuj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+LUSMrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IajFUMuj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYmsI3124474
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WSw25v0bjyM
	ImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=; b=e+LUSMrRDwemHg4p3ifF/lzSPkU
	zt8FGkx3j9M+3A7eYDS6Spkff0SQ4hwBEsrh2+vJ3NP/xNWGQDY6aiISob6rRZ11
	GKoNfvIvpg4u4rN0R4suLbisqtCokQ8WYI/FCyhGDJNsOKTlrssw5PAK+Y40FBbl
	Ostu745vptMplsHY3GwU5g33+3YiR4MfwQdR5vtI2N8COs+F8DVwhU4bmD16YEwM
	lOQakvzEkhyIQOyj/1XfRlVc3wFU9Uq4qTixpS6xp9AJWRHkRz4Ev21DDsCj9Tbx
	Hub8xbfP2NczQ6bgBtrecHN6YQ/HcE4vUdBYbAYKdacU99wfTRM0PB4UX9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuk1t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so106522835ad.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565590; x=1790170390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=IajFUMuj3YDDivI/ZNpbWu2zZ4zfHCxIerLxj9/qsXDpSlrfLL1GdI6bLOHPysux9G
         2jq0R6s9MbGicC42gzHmCiyDatbovPSfZV7pqsRfIVIaCTNcEa2DGYhRTN/9FkHvKQ8O
         5jf5uuZeYxJLz9lE9Kvuqd8WbIzmLD2p/vGEyAu+EZ9qkSJEZ4LVh6NloBdpOvLn/qkR
         pAC9v9L3bvwXkErSdPZg2W2HAaxONVrsTTwj42+c1kYxCZHKmD6IQHXeSZPhO5i/wuB5
         3Si4xxwt2nD2FAH7g6YQBt2DQPzX7l0mtl2Act9Zbk+6K3nOFaDpdv0mbX6Ja9lAvNJK
         PtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565590; x=1790170390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=L+lIcy3a0XIMmYdzBP5GLP7GSGOJRUKDsRBi0U3wAvWnNSesHFaH2tL1xvT3jI70HI
         gBFgzOWVDZha2zxgZWQ3O0QvEeVlavH0RjkTWN/ihovIpgnkIt36Egz0dsUoS2HBBcVJ
         9v6lXb3b4iXxPo219V/FVG0QAaYapCPArYbklpoPlZD5Ndgwo9gE46CI0Ar/Yq/kWBOO
         0W3pRwTrQ/Hex6xUZVus/3DoXE34VmYPQ/9qx8BZtNhpsAf/F/CvDpfnSSXh2BFiKXIw
         sdYfXTmOYJ66Ih56sqfvT+5jaQvc4TKzf1X8wsML5ASPHTN9/aSs/zr7+5cw8cFvGPEC
         0iZA==
X-Forwarded-Encrypted: i=1; AKwUvBwlNa1q0Ua9MxfQYGvKIx5Cdx/60CRHdSNQgNDGEFcWXCZtujbnbbzjv6vhzSEZG7JfZ5nb13bd1TE=@vger.kernel.org
X-Gm-Message-State: AFuF++nB5kQCJ10unk7u7Va1Gzi20ilpaqabcP75L+EKKhFKopEvpFci
	WyjZRSN5PoPGAHmr+vqEOXa8yqhpTKBeDm+mJyLKTn8Uy2JUjBbs9jERHa+hlNhCfGK55NSWfd1
	sAvkpkov95fNs5ttgArVqouX5RqLex+tO4urC2epcueO1VUPOUK3H8F+e+baNTB4=
X-Gm-Gg: AYBFou1r+ziOsLRVl6E4BwmNJjMioDo+VA5Llodqccpz4NcLchtzhv7dIh23ku1EaL/
	AhCHSuftUIL5TquG1hppZ55Iza159ubqLEr0ukqzuFUvAw0tWUE5/9Psc3wWmFB3ZjXlfoxULCz
	JWoJgQQ+4/c9WsnvxKpPYUJ5P+gb8dxcMOOzUzxNj26sCzIFtyl8tjeeDf/rNqrCeGn8p4+48kq
	lK6Dk/0kKxF5y3NOUgcwfqD6Zs7yYx1Inq0lky9RISyYlvcXYfN1pQCC7N+y6MsyhmEpGIGk9e6
	Brjjq8FutNYdIAuAA5U3PvyuhI7CgX6jDpkEPApM4TJnbPTpvj/SgsaPSMPkNp15DKA4G1JkFnx
	wn33L2c/bZMgUDoYFh0rjcNVKbWlWz600
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60389725ad.10.1789565590189;
        Wed, 16 Sep 2026 06:33:10 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60388955ad.10.1789565589697;
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebf2e2sm12077945ad.42.2026.09.16.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for power-loss resume
Date: Wed, 16 Sep 2026 19:03:04 +0530
Message-Id: <20260916133304.3720801-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aqSVKL2riEdZfS0D@vbox>
References: <aqSVKL2riEdZfS0D@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX2aq66QeztHAF
 Mq76JnB6Jj8TxNL6YLxE0bfiA2Q7NvPv+sUEXoeetrRsgKd+XAqm+ra7UevXnTMexHa8bSrGXJh
 pQc96OJxFInWZrHWsfEbczSjv0IfsefHqM2I9rMCA0NwBKJ6hf1RnPi6hIvQTY8o6nHkQ3UAbu5
 jmdtYXy4lSryh7U6IIRGwADL4Uosar8es62lGtTP2cDlJ4YlrfJ1egQA9qZG+f7ZkXlZzWgEJPd
 +zQNVO6ZqdGDXHnEqRUh+k6g9UnuUEzccgI/zdFeDdMtmMMKyVr8EOLBHyvBBaXyQHZjClOfumk
 Mub82Vng6qRoSDGklRZRFzl51Xwel23eowFIgRug9E3eXGS78vSkLGCUtuMtniYDqFTFr+pqqXj
 iiLUe3pVMz25E05bpfk7SUZavOztimldrLe9eZ3G77qVZ/anwuJIAATQKqGeVosGw4z5yhx0LRB
 y8cdqdgGdqYvsJlzQ/Q==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa9a97 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=hk5jl9konaNAbWeGehQA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX0Jo2Z2b+HeVx
 V2Z6NRemw42OS2BPFwHS45FSaXKPmOnAJFluDZyDbGdn1fF5xkGX25EoVNszTLT9IlmxJqzfFC+
 63dJp62qv52HL7dMmR/61oz8y1/NICc=
X-Proofpoint-GUID: Rk1hHGHDBmV45L65HmqKQ9oB5Oy5YTGq
X-Proofpoint-ORIG-GUID: Rk1hHGHDBmV45L65HmqKQ9oB5Oy5YTGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160181

On Thu, Sep 03, 2026, Thinh Nguyen wrote:
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1420,6 +1424,7 @@ struct dwc3 {
>>  	unsigned		wakeup_configured:1;
>>  	unsigned		suspended:1;
>>  	unsigned		susphy_state:1;
>> +	unsigned		xhci_reset_on_resume:1;
>
> Can you move this after dis_split_quirk and add a blank line to separate
> properties from dwc3 state/config fields?
>
>> --- a/drivers/usb/dwc3/host.c
>> +++ b/drivers/usb/dwc3/host.c
>> @@ -129,7 +129,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>>  int dwc3_host_init(struct dwc3 *dwc)
>>  {
>> -	struct property_entry	props[6];
>> +	struct property_entry	props[7];
>
> This should be 8. There's already a fix patch for this. Hopefully it
> gets picked up soon.

Turns out this whole patch isn't needed -- see my reply to Krishna on
this same thread. xhci-plat already walks the parent device chain for
this property, so I'm dropping this patch and attaching it directly on
dwc3-qcom's own device instead, in the "Support broken suspend for
SA8255P" patch later in the series. Both nits go away with it.

Thanks,
Faisal

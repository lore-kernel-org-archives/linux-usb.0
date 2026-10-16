Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BA44C4EB
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139811; cv=none; b=GUTpf+FARaHOlPF8XzooZwTBoNvPR9nD1YCoM0Gp4k7gwoU2+CaqOImads8MDrlbxVkNK9bUBuC0Sccd1nA/bP36Wp+lXqxljuQJcKOmRb3FXtgy74zMV8I6DQ2fUmj/wa4NQwFYVkfZ+o45m7Cb0lpaMLgMlDkpyFxazK6hruo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139811; c=relaxed/simple;
	bh=9HG4Myf/MzWs9emqrTUTe94JsB/+FQptg2zAqa+Luow=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S5BWYIQK5tNVEuyH/ZnP4UdwP7B2LbIY49S0oTB2a/MKxGTTxv3bAHnlJgNbmatQF0I1EhYHYS49fbec0NUiE2gXncPovUpq1HHAW1xssQ25JdWFf/QLESd/93BGErNRr8qJOyBESWlW/qCWBB5VserFlEUeBWnwou58dm9WSMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1youPMe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnRYD9sq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1youPMe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnRYD9sq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2b8WV406119
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 08:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+kSbfg7kpwZHurr+6X37ZZoLppm6N1h+AqBcwmBJ/I=; b=V1youPMe/NMdLUHq
	GhFg0qBfvL8z8iW47Nxh+ypDCp+BuJNy1bvhlW3YNkNjd+2Zuz9TFXKBBomewrNA
	86Vq1OPH91NOLHsQ625Cigsj1gP4X3oOnEk7XS3GjQ5OWivQYbGAq+USkPwgS7jL
	8nRpaQxvkskmu94FWNyvE/5swp8AAJa0b/yOigaSrIutlY45YU6OwPvPKhGt1mKN
	0mx+XU49r6mJcfEpGH6BZk9GMlvvG1spMadclrwr/ydy6HdzQ9ySb12h/jDk0ltx
	DlUkz7wM1sW+/rZKwbImc9Fe87wWp1M7084E4R64ohV+gS4Rb61N8eJRd3/rKPxe
	PWIg3A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2ueb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 08:36:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso3178406eec.0
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 01:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792139805; x=1792744605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+kSbfg7kpwZHurr+6X37ZZoLppm6N1h+AqBcwmBJ/I=;
        b=LnRYD9sqW+ya5/09NbL6B4cF7TFTxhgtPOC2GtllohWRemImKpXh+QMsVsBboi4ox0
         8ZWsVk/esfdsONVZy6d/e3uythZHkoP+IiwHYw7Bye6pdXkiOAgelxthjLw86odtRf2S
         wdVkkTkIpMVOPIqb/as9l+QZVa1DvOdKuLVl6kXgrXFCkqJutvtyV2JTsvr7CoXXU0Gl
         otmCB5zvRPbg5HfOa4qhqDLLllNX92kBjUEySSXlzdMNuzkGl8JyydaOkUDtHjeFIIvA
         QCmLQl35Z/jkXQIJP7UaQvQLlx0Cv2TaEgBiuziLIseGFK5cFJey7jhCt4jZyOjevMHV
         BOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139805; x=1792744605;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+kSbfg7kpwZHurr+6X37ZZoLppm6N1h+AqBcwmBJ/I=;
        b=WK7l+R8BLtdx6N6Q493egeAFp5HdvGVB0QYrfoyx2z5w9hrFrPAnkBLMO9morrmZfo
         CMHPlrSd/A00W8oUhT4dgSuVQ2eR2OCF5KZFj+mDlsgdwBd6t5u5KxtQjZS14BM+Exox
         wsorYFy4rqkgEG0m5Qq0eV5IA7yTdzTPVkUPLgIdXcFFN+OX603dlTPZwTePAin9K7QK
         0mmKa1me97v2+n7IzkW70/VEJAbwZUfIF7C5u2jdbPzpkSJRLztX0iydd6rJNc0QcyT0
         sBLxFGR6MUhyGrL+WVO7ryFQNMy01ie2C/IDSuA683bMeLeUrRaCuNkqT9VcNzrefsVP
         RueA==
X-Forwarded-Encrypted: i=1; AKwUvBw8e06QpaSWPaRh42Z1KgYtmIB9bUX1SLxxpaVwZy+LBJ84/oXQyBFhl3dN/6zwNK4nLl5jKhmCvyo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPxbIKqwJCJzIcsnaJHY1dugVCvw8UX+cFe3YiEfFKhmSvIZrm
	bdb+n1Z8/CmymYIT2Dd9/lmCYjZY3H4Hmbit2kVULTgmO6jg+FMki24U5JxGaZgAm+OdloyQpOP
	7NUKZuvP0XIt2G0KART81+AR5M1r4lnR84BPHdxj4e7mmmQWyQJ4qusoZdtgskmA=
X-Gm-Gg: AYBFou311OLeOk8C8hEFwox7sZwD1r5RmDbF8p0kZ+nJIyI1o/cWQfSfzSRpCRT6WDS
	oeCtvZT5piAT0z82pdyVsfVGakQLKyguXkMfAHxFbD4jTSnXZC8mfk9UnNO7qvAVXqd/8fRLelR
	RI2AmyXXND+jr2hIP0Lpy6oq6IJnmYrEZZEB/MJdcB+GCqstkSvdBemQBlb/0wtVsEwNrz5aIWA
	ocmzdKVFIfq5jwUxD5VJuhkuzMyxxDwP8XUktepvaKIiJHQPhrmOnY0+tBZdLiADT8fWdGOvlNI
	I2wOzCAqel40+/KGce6KSgYKqOSd2ArwCyWv/VCnPRoZX2Zea96dRLnLicQsdOioISbL68OHQ1i
	TzeF2WeIAJZ6jImOiLguP7nqvJ72fkoMFNHp+r7lWiW8QHikEfM1gK68DZ+ksphsP9F9N
X-Received: by 2002:a05:701b:230c:b0:143:2967:c0b1 with SMTP id a92af1059eb24-16a5fc91121mr29418772c88.25.1792139804568;
        Fri, 16 Oct 2026 01:36:44 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:143:2967:c0b1 with SMTP id a92af1059eb24-16a5fc91121mr29418745c88.25.1792139804035;
        Fri, 16 Oct 2026 01:36:44 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm5065302eec.7.2026.10.16.01.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:36:43 -0700 (PDT)
Message-ID: <9119509c-5c04-4b9e-ad50-b5b967c92ff2@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:06:39 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] usb: typec: nb7vpq904m: Set client data in probe to avoid
 crash on remove
To: Chaz Bailey <charles.s.bailey@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-usb@vger.kernel.org,
        stable@vger.kernel.org
References: <20261016080517.156248-1-charles.s.bailey@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016080517.156248-1-charles.s.bailey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX68oNmsjf2UZ9
 N9gWLjBkg+6QggCdbPaPEIR6Q1HsltljAvu03AdmlC29wamttEWaP/0OzzXfKNJ/HMkWVhkCdyi
 /pQKXAP0Xp6laiX5l5ZWnuiirxNEi0g=
X-Proofpoint-ORIG-GUID: wAasZHNqxGe4Vt7UkDEC5bBdTGU5dazT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX0T6u+rzYUJl2
 6xV7MdW9EANPo9WRtDkvUruxNuMN90K5EeB47mkJSooWddsizWGZzQu6TyJx/+WqUdJixBHQJu4
 8nvTBSgQok+e03u5w2YGOi8IGgu4DFtCn8Lmv9NPI5w9xFla7gvDI/VAgf2i60MGyxELe6G5Tyt
 O6PBHswo+pq7e2ShQ3oSr0z5bB+PtfVBX7GXBU+gucyIMqgwo5nT/Gviiu7ZRx+qcTTyh9/Vq2D
 hALGuE1KWgKleONVuBB17yvEH1n2Pf1lFNRpLvtySG4i6JoRyMUbxMrINaue5Cd6T9Ul/hFiJOO
 8EHWfgt4aDGqBG8I9IPaZ5DFM2fA6Rfiy0OSB0iLfHJa5AXqjDnReItaA9OjAeInVyvHoh3yDyv
 TpAbyfFAOD53kRWYImt2rOUEIKsb691ykwhZ5nrxVLJpYivBfaVFBks9o/3U3q2T5cnmxk5JL64
 Jq5k34wa0deZMXSRv6A==
X-Proofpoint-GUID: wAasZHNqxGe4Vt7UkDEC5bBdTGU5dazT
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1e21d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=TLsWTiBSdCI7Qt6q:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vfoRuJi7s0O6CHqACCkA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034



On 10/16/2026 1:35 PM, Chaz Bailey wrote:
> nb7vpq904m_probe() allocates struct nb7vpq904m but neglects to call
> i2c_set_clientdata(client, nb7).
> 
> In nb7vpq904m_remove(), i2c_get_clientdata(client) returns NULL, leading
> to a NULL pointer dereference when accessing nb7->retimer or nb7->sw.
> 
> Set client data upon successful allocation in probe.
> 
> Fixes: 88d8f3ac9c67 ("usb: typec: add support for the nb7vpq904m Type-C Linear Redriver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chaz Bailey <charles.s.bailey@gmail.com>

Minor nit:

Instead of "neglects to call i2c_set_clientdata", mention that "client 
data is not set during probe".

With that,

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

> ---
>   drivers/usb/typec/mux/nb7vpq904m.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index d1fa26ff44..52e3c9db35 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -396,6 +396,7 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>   		return -ENOMEM;
>   
>   	nb7->client = client;
> +	i2c_set_clientdata(client, nb7);
>   
>   	nb7->regmap = devm_regmap_init_i2c(client, &nb7_regmap);
>   	if (IS_ERR(nb7->regmap)) {


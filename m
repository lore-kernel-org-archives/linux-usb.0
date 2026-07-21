Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117F46D091
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656928; cv=none; b=lMQIKsk96UberUiT7lI1IifPNnkPVEExWam/hrbZDWu3wujQj9IB3QfWTY0nHcAi+MEVm2JDk6xTs5Ujw+04nA013pM8pc1YezKLzw1CYYCkoRwGNm4Wva7Z8AcGX0QokJ7qTFOdS8LweeiL4VF51rGtQiOty7VbXinxSK+CJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656928; c=relaxed/simple;
	bh=decvhCD7rUZaotfSLnR7fW05TEK2htOG3JUxmnVt/k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuwEGO24OvXWzNAgYusZCOLiV8zZz+hDPfY9xOuRXssdlIWiE7KFugdj5wjE7BBwdXNY7CIN/3adKVLtyqF4srjtsDPnr2y/PZxVbZKnIWx1KT/n1YLroP/JZFagOZWjqlyfZiKEejr9UVqOj2Gx04fKR0yVdX2kX6viUupHko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0mThoGf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fatWioql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0mThoGf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fatWioql"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2hCc2418337
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 18:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QVPd3FaykXNPUl2MjHVVQrUT
	5ca5W2x0wFjRQ10wSWo=; b=F0mThoGf52JXMPGlX/7LhZTMkz9zq44XG7nwfNIe
	mJ8EbLFIiFNW8N1ZVj5dmxNtOooRHv+ib6cIC377YA5jpkLgur6BLvt8gSOANzR5
	3rK9lM8ItAjidRAzeaZ/xFAdj8+oSmv3JnFwJIssgi4mEAvQtiJiYHEv1g0/KN4T
	5x6KZIIRPRjcSGC9Jl3xYWXG0xIw1Cww5Om76JhtxC8pZNOIRUz4BN5bJQ7f0iGN
	CjGOaJUAn2fzuPpCOi/o5bmSRuyBpn14gZwmqpzjp3RjrnMx+lEjOOAlvG2puH05
	2TrO0HTrGsSTFYA7DGXPBdwrm8/a7mgpABbc8tlu15FiPg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9fk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 18:02:05 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-964172af027so554439241.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 11:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656924; x=1785261724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QVPd3FaykXNPUl2MjHVVQrUT5ca5W2x0wFjRQ10wSWo=;
        b=fatWioqlVNPOzhTrEHk8K7WMY5YNO4e1QWusbXRifduW4mOyIxljv9eDsAQV69BGAe
         23NAeyOcJ500vJI009hCr5OiWejrxhAIGGy8wYaDSWbat4zoYgGAD5GAdcjWeDXQZM2U
         wPYnJmlq4gsgdE1HQxmWFwIkvg8nCCkALTst6e8IA7nBUFInh8vQQxlYT+nm3XzClsHe
         U+Y/bKOjnYFvZkWTjxBKt8jtPHm5H9Avs6vIwt4as5I5/tPY7qXqEByi8W1nmqosmH7O
         +ReOFvz2YHT/MSWuK6aiGCEK2/kKagnFaHm/KWMzP00RmgyRNoHxENoDUqe7e3hI1yp9
         NRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656924; x=1785261724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVPd3FaykXNPUl2MjHVVQrUT5ca5W2x0wFjRQ10wSWo=;
        b=c7vf7eeRblGrhlAQ7lKGkA5KBIDFX4yHuOABnCnvQpbgv5L0emPpSyOJ98N6iitt41
         n0pXiB3Mx07QFxcgPS5bREiA4BwtsZ7Du7pRSxH6HrGw3u5JrLRnSFGgTiKo6C90gJwr
         yekoTjDNr3oF3Jc1nB91pvWXwdnXF1HRzx1kWkza0WR5ZM4yIls12Xnf75Rl/0lBctMt
         +MGBJU1kiM4RuJkiA4utU7WBpUfnNrhgWh7k0euT65GYxEk0I905Dk09edyG0W5woL91
         yxX7N5qymi9xaHaz6ueonXti7OTVfczQOhU+QBWgudvILcG8JVx56TUc0UXvgtm9tOu6
         arLQ==
X-Forwarded-Encrypted: i=1; AHgh+RroGrN0tCxXvP1yQa1bFG5ybWE6HVo/HaMXx6kIsua/kicz9rhwA2VbrpZUMAMUuKiSSJbzl3vGPTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX24eL5VZOGXIk2rTLcZMVy4NpaPfd0BHZOk1heChyXHGPx9xF
	jo2gvsEuNRY1k1xO59Mu4w+W02dPxdJpJn7bto3GNeZL3LLtJfS3Y/kZPj2BJ4Xlkcesbll/jcS
	4XKNWfxpB27rxu7mrM1kQM8H1nCeFKN1KUQmsWYGeyAUT4bsPZsoSv0t6GDe4qNQ=
X-Gm-Gg: AR+sD104rmQtKO5CORUGwPQwRSMGaKtINp5gmNVRR1JSZqVDbn+tg2gAKCQAUEuge77
	RvtxpDqxXx7V1Fa0AE+oetSKnjTMaOIr6CZSLXIGFU52CztOl6yIKqLLwSHJyZCDZUZUs3O5GRQ
	N65gAaHoY9szIFW7ZhsHoTPK7UXt/3+2FDBMAZdpftbtXMY25B+e8V1S6KxuDtOamKU88beejxP
	vkEjEhJHi18Q54OO1a4q9I7XMO/A6gnMadhJ9lDG/dGWQibT5hxOItCzHDO4F2XNrTgJC6O2V7h
	RLNuRohtq9yHfnif0SNJO83dGKnTxpNM6rLhF4uLq3VCOwiurc92MjV9OsCN3nqSlvTPbkE9TxJ
	dt3xsnsgw8aXiOUmZLMGSRM9aPK1Kovx3XAWkfVit+GEyNpMFJSTEpxsRu2Ud5ddnUXeT9+s++o
	1T0gVzQu/LFcNhQw==
X-Received: by 2002:a05:6102:5549:b0:738:40ba:bcbf with SMTP id ada2fe7eead31-7475374ccc5mr6537765137.29.1784656924259;
        Tue, 21 Jul 2026 11:02:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5549:b0:738:40ba:bcbf with SMTP id ada2fe7eead31-7475374ccc5mr6537706137.29.1784656923315;
        Tue, 21 Jul 2026 11:02:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm60911e87.4.2026.07.21.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:02:02 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:02:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        "Dr. David Alan Gilbert" <dave@treblig.org>
Subject: Re: [PATCH 3/5] usb: typec: mux: ps883x: refactor DP altmode
 handling and support TYPEC_DP_STATE_F
Message-ID: <ofc23cgbswmefrpxf6donpopayfaxrfopcp6p55evxkvw4rmdq@kv226b4tzzfu>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-ps883x-disable-usb4-v1-3-cec86d0b909e@oldschoolsolutions.biz>
X-Proofpoint-ORIG-GUID: tk37L9CP624N3pjQcxXulGTHnDVSA_PN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX/M0D9Ez95+XM
 Dq5bvJ8SergSOAhIz588QKymQxFzrcWqFXIafJa5xWMf5jIa5qZ7cl9GGqltqqUU5fsWw2MXfG9
 jHEyVRMxt+AAp/L8Um0Z5dn6T4t+6XqwL932yaYnnz+kWsnFaDDYQ/QmcPDdH6KNcCas5+45D2N
 ETsTiyVwnM+GPUeWBA7ia2bbpEbNOzuKekK5IJeczXgcorJ0rx/LsanxLqg4g0ked1bJGRZl6Ve
 BbdXJDYm8QK/74s0m2+kcc1Je1Nse1R44H0jKyUuBKzVuifUw8QXR2jZlzcMdnalY86CkWHOE3b
 Gvi38eyAkcYwrlcclrHHE9viQDEZzqQpEhmFnL9t6NLRK4DQEfnOf1RhWC+IicaYm220X/9HXhk
 nJcWG5rzpjxS6ptSmhfOygKwfbJOF9Gi9m/qAARmv+QjHKjPfAEqoj2eL5kimRcc2huln/XmyBE
 0aK6hx23O1fCHP9kXOw==
X-Proofpoint-GUID: tk37L9CP624N3pjQcxXulGTHnDVSA_PN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX0KtnOZRt6cIs
 2uqqjI5vcaGPr1X4z2Hch7oviP8QjtHGGEChvyoYVFBZ0FIDz6awV6QyrJOxDGqUmOKrvLYQBCc
 7/Ez9OJK0JNGeTaL5ray+Ywvbn4fFGE=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fb41d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gxl3bz0cAAAA:8
 a=EUspDBNiAAAA:8 a=1VPybmiMx8NHx69vg6AA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210190

On Sat, Jul 18, 2026 at 07:06:31PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Several docks, including the Lenovo 40B0 and SSK SC220, still send the
> legacy TYPEC_DP_STATE_F mode request (deprecated since DisplayPort Alt
> Mode spec version 1.0b). Treat it as USB3 + DP altmode (same as
> TYPEC_DP_STATE_D) so that DP altmode works correctly, especially on
> the 40B0 in Type-C fallback mode.
> 
> Extract the state handling into ps883x_apply_dp_altmode() (modelled
> after qmp-combo-phy) for consistency.
> 
> Assisted-by: Grok(xAI):4.3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/typec/mux/ps883x.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)

Generally it's not recommended to mix refactorings and the sensible
changes. Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

(feel free to retain it if you split it into two patches).

> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 3fa26ce01a9c9..3533d4f363286 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -188,6 +188,25 @@ static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
>  	return 0;
>  }
>  
> +static void ps883x_apply_dp_altmode(int *cfg0, int *cfg1, int dp_state)
> +{
> +	*cfg1 |= CONN_STATUS_1_DP_CONNECTED | CONN_STATUS_1_DP_HPD_LEVEL;
> +
> +	switch (dp_state) {
> +	case TYPEC_DP_STATE_D:
> +	case TYPEC_DP_STATE_F:
> +		*cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
> +		fallthrough;
> +	case TYPEC_DP_STATE_C:
> +	case TYPEC_DP_STATE_E:
> +		*cfg1 |= CONN_STATUS_1_DP_SINK_REQUESTED |
> +			 CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state *state)
>  {
>  	struct typec_thunderbolt_data *tb_data;
> @@ -203,24 +222,10 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
>  	if (state->alt) {
>  		switch (state->alt->svid) {
>  		case USB_TYPEC_DP_SID:
> -			cfg1 |= CONN_STATUS_1_DP_CONNECTED |
> -				CONN_STATUS_1_DP_HPD_LEVEL;
> -
> -			switch (state->mode)  {
> -			case TYPEC_DP_STATE_D:
> -				cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
> -				fallthrough;
> -			case TYPEC_DP_STATE_C:
> -				cfg1 |= CONN_STATUS_1_DP_SINK_REQUESTED |
> -					CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
> -				break;
> -			default: /* MODE_E */
> -				break;
> -			}
> +			ps883x_apply_dp_altmode(&cfg0, &cfg1, state->mode);
>  			break;
>  		case USB_TYPEC_TBT_SID:
>  			tb_data = state->data;
> -
>  			/* Unconditional */
>  			cfg2 |= CONN_STATUS_2_TBT_CONNECTED;
>  
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

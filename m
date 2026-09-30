Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517853D1CCA
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 08:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758205; cv=none; b=Ijfj4lJvB5SDhF5I1+ogSpy3fvSB6HaWQH1uYoW7m0+3HyCVrc5JsjW/Am5Uoz5uc/w5dI6I+nEfHHodhfG0VS4ym24kF5LeGI+jL5bNuwOGmYKVLB9g4RgSyUFIGJOAUDzSy7xHe8lZhejCWC4Z/UEWf9/hNs9WRO+OOeQUEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758205; c=relaxed/simple;
	bh=jvl3OtauOMAvlGH6YR1If4nsibXiUkKUqdJqKkyztq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tacdXIacLAFNdXerthmqJGftZCgd9wo1ZDdFXp+UGu3w3elMvhEMp4JsfCWW0XJNJIxiPGWamFSMykb5w4AGnpmne+QIJYUnZst5/u7flPFyjrAngB7Z3aug0koyr0f2pSdT/ieEY6Q1omrZv4fQfrEvweZNW+u7wMG0sofV6IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEyHIAL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEk0J4x9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEyHIAL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEk0J4x9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dLDM4047194
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 08:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I0I6m0L9/65tQWj6l6zCMqQP
	S8baIca5kiqDML4woF0=; b=kEyHIAL5FeXlLxIEEBjgs9QG69ZYgHocYo37c7pl
	E6OyOLFNwslkg1tbCLQ6KYSA3sF7Y2n7XS4tNP9itbP8mqKbJXSYeD78L65wmwDL
	1d84iAgEEzjKHf7whG8MnQHL67cALeEle24UeC79cL935MRYVs00KLNnlMh/ru/z
	q/tN3GNv/FRXLsPxbKKsqo0XsSX4c9q43nLq/+uISGOmyvhroSTLa4XXnM17NUBz
	AUox7zfe0nU5laaUF22bL7quZwcS3eYCjZ9dJwqEeVAE422wpeJIsx54bAeGpap6
	B0WhzOcZ+I+c48P/JlAVzNbp5mcfAJ5toxWnOgwJWtysWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0mfaaq1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 08:50:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34316295d86so9045965eec.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790758203; x=1791363003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I0I6m0L9/65tQWj6l6zCMqQPS8baIca5kiqDML4woF0=;
        b=SEk0J4x9L9M5ueOVDF9Vq4j1zp8nDMsDJg8Fw7KcjXJJG8C9SJW0ap9nBys8RqHJrQ
         WJOA2DUcj0FylDaCRaeJqRHvzY+X1XQY1MO5+EsMY1Ton50Vtx4odMmYsUidRPdZmsql
         ArbZ0f/jlSAZGNK34mscuBX/vhj+6SFo5eU0SRtPgH4osXzbbfZ9eL/ySk349YusOOxb
         A9sWDrcDmK4n6FJ9ti/5tmZo4RrrJ7V/ll6Mbxr/vyj1DD6UuxjPEhyfNKN26J0LbdSL
         lN05S0pMo7dQy3Wzc5AidnzMXvdsyJp0OBvhstHypsqXCEs+ex4i1yc8P6qJlh4muRzX
         wAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758203; x=1791363003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0I6m0L9/65tQWj6l6zCMqQPS8baIca5kiqDML4woF0=;
        b=vAeNXV0zcDOSYNFWDPGbfIEknCQjidGfocUmtpXUPQPrt6nq4Hlb6O/eGxyTQzkUa8
         k56akbEnPud/3TCIEn198VZATuaegrwYuMV38W2LnOh9W6qTtZJS3JZnwucedDCzv5Zh
         PqfNeLmeu8D5yyAKxIqqNlPiAbhP0hdaqJdc8+00CVjgdhDcfRZLog6TMh+3/XipFSVw
         AEOBDQxolEiV4RtD3w81+pHj/xnRuKQXldpx+HJX5xPnDsiksiB1pifXlXnCuTq8TnL9
         /BKKMfaeDmr/5YuMcuuNxat10cwrqecSr+2AiJR6nobhunbwmbWclWT+32z4K6LDk7LF
         Na4w==
X-Forwarded-Encrypted: i=1; AKwUvBzRuh9wIZgrgTJlFzJpXuDFJnrs+U1FLbYn9V0SwgEMt37NxPU70TQ3oSOeDT0Pfh430gTzXob+mRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9LgyTqgb4HV0yRjIICI8vZTNBpgbWFP9EqigHmWX9+BRU6qE2
	ocML8Iz6ivL9546wxYB0iXfYmlHvZMVf+OAdfONZ7sB00lSU5mMRoIk0pq9ccp3kkH2ff109hMI
	SvBVTzTZXY6zP/B/xQ9s95On6MDb2gpIsd5upb5d5WibV5hjPraAeNV+68bQkhIo=
X-Gm-Gg: AYBFou2k86InvVTFKZ70y2iYer5qLexdekojlCtp1LXkgGkovqO4z0mAUupB7jNvEIG
	IXMUrNatMUtH7LpOrOK6OFoLeZ98gzPem2xKzi0G+QJU173OLuuHR4oZPCj5WNDisBbGRnfNx0S
	1ZGYKfUXd/Gf6msOgaR56GRi1qzyXVe4L0pIKk9SdmdSUfLmcfDHhG8CcJbvWG9hU1rlj9y64ix
	5aokEMfBELEZ4Uv/ehHRV6I54vFcahzTmlrdKkhBZCC2Ye19+iGIQ8mkcZVsNFPxjm5XLDIaq/F
	7seFEpFby+wNZ9ETwjFDKATZqeVHt3kU/tfF9TJ0Q4l0ob/uEWnjbVuYDA0mh1S17ZHVZatFsX9
	UNMzNjuBHuTFRhBoc9GEKBQnicmb+KG8OsUktxAtU7dAk1Hj5
X-Received: by 2002:a05:7301:150c:b0:34d:2c1a:988e with SMTP id 5a478bee46e88-34d2c1a9d83mr320713eec.38.1790758202631;
        Wed, 30 Sep 2026 01:50:02 -0700 (PDT)
X-Received: by 2002:a05:7301:150c:b0:34d:2c1a:988e with SMTP id 5a478bee46e88-34d2c1a9d83mr320687eec.38.1790758202056;
        Wed, 30 Sep 2026 01:50:02 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf4a605c2sm2207496eec.7.2026.09.30.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:50:01 -0700 (PDT)
Date: Wed, 30 Sep 2026 01:50:00 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Set ucsi->connector before enabling
 notifications
Message-ID: <arzNOP4jBd9uqnGv@hu-petche-lv.qualcomm.com>
References: <20260929092939.1806907-1-uttkarsh.aggarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929092939.1806907-1-uttkarsh.aggarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX/JZzqpeW4FGc
 UeTo4G9BFlaJPaLE5KEW1hJ/HiXN6iJaeZVFuE/iWrNR/XWMqBN83wUdR7ZAWURV3mgI0PwfR9P
 wQGRJYWLJ7pNffk8luPUH0zN/0eYQ/zQABe4PhxaSWEpYYXby40yOJHOH07drr5UD8R4vkBadyn
 wgHSVrR+IbR0mBk5Cmtp0hv4bschTbw/52+sOC44/JRTmeygkKafO22yvJhuQ5VkXtyL3DY7W5E
 wDP5lGlp2kLJcsSAHw8cSLpuFwGtbje+CokGsy+LeEwW9gttgYzNYoewxKuQlhmgr99uf3RmQIf
 0CH+h9Heev+3QPZPBFb74KJG8DgfrGUZ0JiJbuu/iEt0br63yCnt0/HTvxPOiq4IPrSuuRRvgwK
 7hzRj9Rx0nzqt9iRdw5Z0EWRVWwRUIisJ4g5RpwOcixS9kXuVpomb3539So1pYR/+3BO/PjQhRP
 3OBvEfjFMA8bOKPQKmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNSBTYWx0ZWRfX3EuXD2p1AKeg
 5S3MQmOAcNxYwFRumUAkN3FrgXX4/wPz/Aou7XtXD/nmmLSmLHDHHocWFogqCOW+Pa8nBn6uomn
 D0MHesnl3lajJ1Q1qWH+sjfOxBfG6cY=
X-Authority-Analysis: v=2.4 cv=RZEFmFtv c=1 sm=1 tr=0 ts=6abccd3b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5V5iOW8oFJG4Np5ERE4A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: cs3DYH4KylElv7kBO0fP5ugJH7WxxtBZ
X-Proofpoint-ORIG-GUID: cs3DYH4KylElv7kBO0fP5ugJH7WxxtBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300035

On 26-09-29 14:59:39, Uttkarsh Aggarwal wrote:
> In ucsi_init(), ucsi->connector is assigned only after the
> UCSI_SET_NOTIFICATION_ENABLE command completes. But once that command
> is sent, the PPM is free to raise a connector change notification at
> any time, which is handled through:
> 
>     ucsi_notify_common() -> ucsi_connector_change()
> 
> ucsi_connector_change() indexes into ucsi->connector to get the
> connector and schedule its work item. If this notification arrives
> before ucsi_init() reaches the "ucsi->connector = connector;" line,
> ucsi->connector is still NULL and the driver crashes dereferencing it.
> 
> Fix this by setting ucsi->connector right after the connectors are
> registered, before notifications are enabled, so it is always valid
> by the time a connector change event can be delivered. Also clear
> ucsi->connector in the err_unregister path so it isn't left pointing
> at freed memory if a later step in ucsi_init() fails.
> 
> Fixes: 0482c34ec6f8 ("usb: ucsi: Fix ucsi->connector race")
> Cc: stable@vger.kernel.org
> Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

It is better cc the one who gave you the comment :)

Peter
> ---
> Changes in v2:
>  - Add Fixes tag pointing to 0482c34ec6f8 ("usb: ucsi: Fix ucsi->connector race").
>  - Add Cc: stable@vger.kernel.org.
>  - Link to v1: https://lore.kernel.org/all/20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com/
> 
>  drivers/usb/typec/ucsi/ucsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bef3f9b71d71..8f7b73a9f4f4 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2122,6 +2122,14 @@ static int ucsi_init(struct ucsi *ucsi)
>  			goto err_unregister;
>  	}
>  
> +	/*
> +	 * Set ucsi->connector before enabling notifications. A connector
> +	 * change event can be handled as soon as the notifications are
> +	 * enabled below, and ucsi_connector_change() indexes into
> +	 * ucsi->connector, so it must not be NULL at that point.
> +	 */
> +	ucsi->connector = connector;
> +
>  	/* Enable all supported notifications */
>  	ntfy = ucsi_get_supported_notifications(ucsi);
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
> @@ -2129,7 +2137,6 @@ static int ucsi_init(struct ucsi *ucsi)
>  	if (ret < 0)
>  		goto err_unregister;
>  
> -	ucsi->connector = connector;
>  	ucsi->ntfy = ntfy;
>  
>  	mutex_lock(&ucsi->ppm_lock);
> @@ -2143,6 +2150,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  	return 0;
>  
>  err_unregister:
> +	ucsi->connector = NULL;
>  	for (con = connector; con->port; con++)
>  		ucsi_unregister_port(con);
>  	for (i = 0; i < ucsi->cap.num_connectors; i++)
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

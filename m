Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFB44A41B
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148257; cv=none; b=uALaq1AWTjguaGuQCUAxR/OfcZx+Cw69jdauwWyGoA73qbLN7WzKACSCxHIa2PeUXHMpoUFDJSdkZfnLjaZFSdNdIeYkxaGq0T5dmsKRPuUVujgVpIAXgfnQL+Z64K1sJuQLv3i0JQJIL/tYK6qjORBEjUOMRFCNs0WF01fYfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148257; c=relaxed/simple;
	bh=QBIdntIEmQ2xP4wCJnqN+jdkIkfhSNrtafmsVMgAY7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOjysNA4xjcV8YGMVtgm+TVmMYMTad0yQWN+/1UuQM6Hgtj2duSPahxadEbH/8rs7i1ygbgfaGVGfEs81hkWQUyCwTWeJBlxoTu3csQIvoYwmzd7Ik5yWzbFGWoW9R2dHaDlpaRP5nVx9SWhgRr/0FKpQxYep9Bsx53fbV5ALjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0yvsq6d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8x7ftgr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0yvsq6d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8x7ftgr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79xZ81874587
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=StiXOR1Zsa3I0z00CmFf2gan
	ziT8Ta8TYsM9Gw+uB28=; b=g0yvsq6d5oCjyfsqZrZaZSfd0tFoGa2BjLpF/wJA
	9reZEj2Pga9fOwQlD325v/Qj41H0o0J3bihG3e7RFT+BiwoFCfHjKvqY1pCAaWQA
	/Be02QE+B9Bf4NfV74Lsg9UQznMxAn7x/PD3oDj8EKC/Fl/4wVg5TnAd0rd+gWTv
	C9pPKGzo2wfciHYb1AjQwNbC/sxtiI8Acuced3jobE+ehbkuCie4xs1jLRnV2xW5
	hiFBb6VlkwLwccxLA8F8HJfHPB9psKpv9440ItbZAMMCtPzy648nHDflgOtGlP4g
	/22s6pFbkzaM5AKAbdWgt2aYk7kbpWBAUI7jE5D6GIuyCg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c2s9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:24:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1438fef603cso915985c88.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 00:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790148252; x=1790753052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=StiXOR1Zsa3I0z00CmFf2ganziT8Ta8TYsM9Gw+uB28=;
        b=L8x7ftgrKyLwNTLH11R/mh93W71Mvpwq9mQThGwHBm6bHls5DduKuuUI6A7bGxeEHq
         Lvf+o42i5XqK4E6YFwvab8dqwGgaXy9Z9BhyDBz2sEsfWW2RHKUL4ZSSeGmt7Ig7RRLa
         gDkZJqfYpZOiX26XyyqMpsyPqkr/nTPHm24hyQjD7KFGgxCUfn5sGZhobKKnGR7R0Q5k
         a/QCCDwoHOvMRWiTJIeyEfOQ+dqQEEBRmSnRLHdQfzvehlpvsvbh7VHNkADaNyoaedwH
         j9yqNmAnzNXVB7K6KjmOY7QC2dMgg6v3V8rzJxl+GHnsjUOsC4NZOH2GZLhMB+aAlTsA
         FjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148252; x=1790753052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StiXOR1Zsa3I0z00CmFf2ganziT8Ta8TYsM9Gw+uB28=;
        b=OFJChpc/fY6m3v+m5tZG5R1XLjbGSZGtkeVkTkq4mWiI1/DGQHQh2OdEo/LiRYpZC0
         mOASo34MBeXK4I30gJlQyU7Pnq2d2BcB9rvKFr49SPHZcnSLKi0+JUSra0UdIoxMDioS
         fvPCnAO/LF0A4Jql38i/sYF0pFy9I1tj2PoHFEMT9E3rSwOlSctOXzkm4wdkWnN+UM0Z
         NpjVpiwsXch4GQ+hQtAE7IvgtCFBd0dUnacwTLyp0JIx1KG8hwKB+xZSE9JVhhGajp0L
         iPoGtsd4WUWmnIGhw/P9JMlFkoI25Aq708w+HHJJ9oVzddwfvfEgQVYJ4E3lTglMMoZF
         /8TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn8fV6WsBZNaa+C2YSW1YeNVUxz6FpBYd2OJAGyUXQv+7aUDoy5D+HHkUoeWswGu7NIyjLaa/qUM4=@vger.kernel.org
X-Gm-Message-State: AFuF++mLlLsDJUtEwUf8o1E5xuek3+tU8w7GbfuuukDrvLxpOTLPB+uM
	zv5xTZgqmE7MysG2o5v7PqDsoXt+JIW3bhwgwQVJz4k685PeJL7hQxMiwHI1McRczN1dhxrDYfT
	AdwxabbfxBHCFOFHZE5ZiskCfI1sOb7MB9SJGh9yTh7dIsy44Da2BGlPvEnysFCcb+yoJs0k=
X-Gm-Gg: AYBFou216UVlt8JNJ/lRSX3cVWx/UbTJU1kkbZZhzlHOVYmvPiiWv+GGzx4gk+bfhTO
	OF5DH2nsXxjcXaAyJENQbcrRefA2PQfKtbv66nXDSlON47kG8EbpJGAiUyJG8VFm5mLxt6Fx3UY
	kYT3b7dHtNYChqhsy4FTW//kUc46ixetk0rMHN1ihKZNml9xSwVMBqnS6Gyy5uv1b6qEkfKoQwc
	aL1ctt7a3tQlyV0PfDsHZg8FXn29S1M9HMBV6tPLPgp5ssYfhUacgOoDFIPeFqhk/SbcRqwIbJB
	2NoPZmKhhMBdiiu1RKUbePd+f5MZcGQXPJ+rLyrNY3iH327PoeE9ynmQ4iiJG/QbC88sJamvcDe
	7JxvOqDjqnO/XnoP9+a0KHuybOJ7H/lKYgSyJSYxMB9sZjrPY
X-Received: by 2002:a05:7022:29c:20b0:144:f9e5:c355 with SMTP id a92af1059eb24-144f9e5c387mr2040722c88.41.1790148252298;
        Wed, 23 Sep 2026 00:24:12 -0700 (PDT)
X-Received: by 2002:a05:7022:29c:20b0:144:f9e5:c355 with SMTP id a92af1059eb24-144f9e5c387mr2040695c88.41.1790148251841;
        Wed, 23 Sep 2026 00:24:11 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm3880534c88.10.2026.09.23.00.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:24:11 -0700 (PDT)
Date: Wed, 23 Sep 2026 00:24:09 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Set ucsi->connector before enabling
 notifications
Message-ID: <arN-mTL7YwNSJKjX@hu-petche-lv.qualcomm.com>
References: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923060434.2599545-1-uttkarsh.aggarwal@oss.qualcomm.com>
X-Proofpoint-GUID: 4PF8ru_A3XEq7RWyGAu1RF9J8Fkjng74
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyOSBTYWx0ZWRfXxiRBi+sb2pYf
 qQyRnV7opGwmizNsNazPEBBVMMK1xy4qriQhb4jKwq8SVbSBQ/aT+3+LivYpMRy1WJbfp0TNn4J
 jdfyRYCZlqeUZHuU/PUF3sqIoOzMiUc=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab37e9e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5V5iOW8oFJG4Np5ERE4A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 4PF8ru_A3XEq7RWyGAu1RF9J8Fkjng74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyOSBTYWx0ZWRfX1woqoEb0V0J2
 Dje8+XLR+b/UKXbmxCKxMlIJXRUwHKG2CnjTc3RlL8Lwsmp96WN+LZYIug5Cz4+ofZbP2lN/MNN
 HnuWB31wd5xfuKClZXMEvY+iFs9p6/vAhff+Ed+WxG+NAp1anuVXNhgRVJZM7+Pm6vTUrANZ0Dd
 KziTBHtm2xZK9mGpl6uTEcyME1NF8SiZMNR5gFqNjsi6iu6XQ7bFNXJJOvaYFJxZ5/RS9Kdl4Q1
 fI2rxAbey0oDhHhzrnGCvDFYNZWJo8uYxxg7vHfqKYg7bxHPB61N4XaaAQgLv/SwooIzw7605jS
 4ah6H4cKUJCk3NNtPnberWcape4M4QDQWf+EAc0bsBGEBbJZZKw2uW6DiVBakbWLmW3uDixjVle
 4utGLkcP1qwpMMoQbCuu2hzzvj9cCODO6sd6ZOX6HlSVy/rwFg0xdOZJDdPlhedD8bbwAkEJC6s
 0UyL87Y8SM371+w1wAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230029

On 26-09-23 11:34:34, Uttkarsh Aggarwal wrote:
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

If you have logs for it, you can attach it.

> 
> Fix this by setting ucsi->connector right after the connectors are
> registered, before notifications are enabled, so it is always valid
> by the time a connector change event can be delivered. Also clear
> ucsi->connector in the err_unregister path so it isn't left pointing
> at freed memory if a later step in ucsi_init() fails.
> 
> Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>

It seems it is a bug. You could add Fixed-by tag and Cc to stable tree.

Peter
> ---
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

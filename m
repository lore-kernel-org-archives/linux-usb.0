Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F35486E46
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549275; cv=none; b=HgKCe2MbZfJB+rR8Ys6nOImUMoGzCYawTYYvM9T8o+29mLr42npI/GQ3yHJTLVpTkSAOt8vS5uaIpZFABXOSrT16qS/4APPc5gzKmAOqBsHUW6sPHW4bYcEyx6TJsDS/GUjak1/jKu0Q2PC5la+lnpOQJX7eDMvXaTh1KWhvAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549275; c=relaxed/simple;
	bh=CWBDM2qqMRRPmKNdOVeDiRRqi7MZd4f2mtsjAI+eLnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFevT8KuxMpFDdZzH1l9td6cVTo1oTpciF/YBjfLZlX8mZEnZjUhDN6D5LXQbtQFNcQxRVajb79kfVw+eZMSiaF4eMQMIBBQloFbLyGPm6dq0C1kscImDW4oZFLdWi6QQ25Wgmwoaoh866pFhRPPcBPhbHUVmdSdP1HKpknf3GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/6ad4lK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9M6lubo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/6ad4lK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9M6lubo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68f2M1730563
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 09:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BaNXMbsKLmmQU0DHI8wG9aQCGqFB8wg+jxU2xGsRTTM=; b=T/6ad4lKrbqbrVP1
	asH/3zWYxxkg8tXDLfzaXeoEL8p3v9Pfs5TiH9SumOtfvm6Hhvr7bALP2iq+SzcT
	db3iJAaGleup6zDeTy1SY0DhGSzLk/a2Qq/NOX2ZzdH/S7EYxZTk5WCxrODpot/A
	uHLJROWE1gX9feN8b3C3W02Q780QV2o5MZfpkjsrs28GaxzJWXV3PdYlhoC3WKqN
	qN57khrNllB9E8tby+WGa/b7nzHRNh+6aALMEepXljR/j8MMNWqE05J2bQtGLNu2
	SEUiy9R+MUxFOgYzcX/QE3I2y61Uaauk6GIciACvkB8k655rwV8dG8dl2FP3Fo6L
	lClZvg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7h4w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 09:01:08 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-807383233b9so3332823a34.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 02:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549268; x=1790154068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaNXMbsKLmmQU0DHI8wG9aQCGqFB8wg+jxU2xGsRTTM=;
        b=b9M6lubo4tYmPie2xJDtyv4JSefI6Xo0VXVW34PgJtfi4J4JTMSV4rqWYM+di+v1aG
         UOSY+6e2+9l+XkMMlTKCOwG2Nc8pnoeSpS+zwCjHqc3a9MwYjmZB19pT8kNjfok/9PG+
         UB4Wo7H+AVYLyGoXlXQn1YlcHYvTNL6RNJjhQUBpM4dn4Fh3xda696QmUUhWM6/dK9kb
         XdsVM1fsNq11QpaGUA9wS4wrnxhzdaMGutvJC+UZ9jymt4dsP/Ge1X9oZ07ALaylYDYg
         zO79UuDYJVVwL1X050rKR3/wTaZ+wWrxj1tSgg4BJ5w2WBW5YT1yH11UURk0R7PkN0Js
         w0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549268; x=1790154068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BaNXMbsKLmmQU0DHI8wG9aQCGqFB8wg+jxU2xGsRTTM=;
        b=hycH3jiby2NxxDT7VSDd5F7PhS0S1rXFUYMREFDGK8qCNpcr9zm+t3iyWlMP9yTBJR
         OoWna7yq7ECFLHz27GMExqIehHZPR98ZwJofYRYswJC/GI4uSirVHm0iQ9Up7MJ12Mps
         ctbGvYoLAV3y8l6HO1gaiopQ6IctVUyi4IULBFe0v1dq3rZcaU6wviENR+jyrhUEbyBM
         4tXBdI8VO2eQs/p+en2pSsXfoAUCqwCZ3XPQqK/UnM6k11pMNwEQyaTe77oDKn9asO61
         eJhSxO4DFw5iGupccK8Yr1PbT86ojVt2DfyXXg7pXFbMSVUZfYXg3HmAs+pjPl9ubqs9
         wZCA==
X-Gm-Message-State: AFuF++nArpf7gy6QVwxRUSQ1xHIkbFVJJkmQ+JZY9KBVYFrKKMwghsmk
	t2J9zdZrCMRJbgA1fbda1PZPYRZflHYjibfQoo28Y5lPKA8KLUq8d0+jDT8LuEOM3k6yEpBLrGK
	6HbAyakx5HgnggX0U5gYYrWYfVBXc5U4Fp1BqJ6akTLDVZNxxaA+CopG3dlEtD50=
X-Gm-Gg: AYBFou1h9JucJb7fQHD+v6Mfp0tWxkAxhAWT/MGd7siLWCboMnttRh5ox9myKEdOL3n
	TCCQEjgKCqvOkw3xAZ34xsRziu8xdtgDNga/INLieeFHxmrnIvrt0kOEKu+u3ddAVR4GZDFTrDU
	EbIsaBGfY4BI1tRRs+wQNUzHnA6GWGPfX/W/7+f75V+QrRCbKynoIQoESFfgSmdmFlL+T4Bj4hm
	6xry166LuV6DSJVqr0fiUEUrjHnscNHaKmH6kOz4/FhLPw40Lpl51IZg9U5cF4eRFuIPLrO6y37
	9HdiRiYL7cQnwFh0Yo4oTXsLLu2qN9nLvcFfStf3yyQEejn2heEPq+WYsqP7K918evGD2zDI0Cu
	Eawws0nm28J32bo3Qsxa23Stgnc60Eg==
X-Received: by 2002:a4a:e913:0:b0:6c1:c628:b0eb with SMTP id 006d021491bc7-6c7d1cbf5aemr1689513eaf.25.1789549267929;
        Wed, 16 Sep 2026 02:01:07 -0700 (PDT)
X-Received: by 2002:a4a:e913:0:b0:6c1:c628:b0eb with SMTP id 006d021491bc7-6c7d1cbf5aemr1689419eaf.25.1789549266537;
        Wed, 16 Sep 2026 02:01:06 -0700 (PDT)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm4617242c88.11.2026.09.16.02.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:01:05 -0700 (PDT)
Message-ID: <75a26e11-8780-41de-aa69-d5cd34d68bb3@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:31:01 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_serial: fix NULL deref in gs_close() after
 failed open
To: brianellis@gotenna.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuen-Han Tsai <khtsai@google.com>, stable@vger.kernel.org
References: <20260910-u_serial-gs-close-null-v1-1-9a5e848b1dfb@gotenna.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260910-u_serial-gs-close-null-v1-1-9a5e848b1dfb@gotenna.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N9DwPRby3-gGbvNyeqEBmT0bAlprLyRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX7tNgJdpnBKyB
 eVd2yKz5o7LXQAAB818dMLSz48nRJ7U8pROs7kpbu8C4PAZnmXgPnMmov8QY5ILKknZSuQsVMG8
 9QmSUe3xZ+7B5uID34u0Lg37vpA//eucemAfCUZauR1/sb2YWzzX6WeFrXyjD1cwXQ86CilN7v4
 OHLIRxAkVxTAOUbLD2jwevxCS6Ao8J+KCgztqhIainwIE2kqSxuEVSvtEA3G1Uqkm1LYw6I6VBF
 0emVf6auLKbhNP+pTdt9BGUOxAPmvo+IIKqj3XXL9JDOjowVE4wKyt0dH9DR1rHJUXmrMON8XEc
 efq0O6fbB/toBECkEbbpWw7o5fl9XF4PKo+078We3AtHYZp3G2vdpt+2avfTfxUNC64t/F23gkR
 5dIaocab0gtHx6sI4p50Le/jGwc4YBgmWfipTWbqwwfiMBmkjLdvy3ToXbWdu3CnQ+OZVYVk8li
 GPY2RL56Kr4wnn3U7Nw==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa5ad4 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fDP6uvXCAAAA:8 a=eruXzHqZ9En46dhP4nYA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=wfRXX3dx_hO_3EqEzryc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX67sUuro7Fvey
 4RUIZi0d0vZ05+Af8GS+7anCRHcG5s+chlswd17fQMrTGze0u2Vl7ygFvCDre1F3CL6Ue9psju6
 4B5fsL3EeWWgI2ewd3ysGe6J49bk8JQ=
X-Proofpoint-GUID: N9DwPRby3-gGbvNyeqEBmT0bAlprLyRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116



On 9/11/2026 1:23 AM, Brian Ellis via B4 Relay wrote:
> From: Brian Ellis <brianellis@gotenna.com>
> 
> gs_close() dereferences tty->driver_data without checking it:
> 
> 	struct gs_port *port = tty->driver_data;
> 	struct gserial	*gser;
> 
> 	spin_lock_irq(&port->port_lock);
> 

[...]

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index cdd1dfc66..5bbb4d04b 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -695,6 +695,13 @@ static void gs_close(struct tty_struct *tty, struct file *file)
>  	struct gs_port *port = tty->driver_data;
>  	struct gserial	*gser;
>  
> +	/*
> +	 * tty_open() calls tty_release(), and hence this, when ->open()
> +	 * failed before gs_open() had set tty->driver_data.
> +	 */

The patch looks good.
Minor nitpick, can you rephrase this comment?

> +	if (!port)
> +		return;
> +
>  	spin_lock_irq(&port->port_lock);
>  
>  	if (port->port.count != 1) {
> 
> ---
> base-commit: be4219dd98608736e13e0b790ef742b76a13254d
> change-id: 20260910-u_serial-gs-close-null-a80a436666e8
> 
> Best regards,

Regards,
Prashanth K

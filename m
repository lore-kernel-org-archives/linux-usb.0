Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFD333A9D6
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822345; cv=none; b=S4mZk7eeIvyMNlEX5A0ZPgNDbAKpTsoGdRE4NHXal5zW2tdlpsXeElHW82bSlJ7W+9h4NXc8751Zqf0VSeGAVOAWyXq9cduXttkQEMXiW1UA7PToQ3ulyBri5WgXMjj09+LMQ1vcoI/SIITIJv0tojr6o2zQ0OTc6P/agbcjYYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822345; c=relaxed/simple;
	bh=HibY2yVbJXZTc6DBlwdMDBsFHqSRLxYPMVNLoQ1p3wc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p/4gLNNFCcLdUuZbxGI3w4ffw6FrgaKglRHc30S8sb/reR/Vm4Re7ceCHBDizSzW5CJ7kLAotl5i4myfYyCFRB+xH0v6I8n4MIoL8DbjavqgyrDMNKQ6GSCcggeD5yLJYpXtYmxIIz33rzzJ/v2jvExmLJVsV+PI9K2px8pVqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUqcBjtF; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUqcBjtF"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34cde269e1bso913973eec.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790822343; x=1791427143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QxM9bT7cYjfTboFQvHDwSX62x29YcBN8kbWxUGtmO+s=;
        b=EUqcBjtFMW2uQXwjhQFuvXhuriBq4K8NEP+UBrMQrdX8U4xku8812n+V8uaio3Dpkt
         wq/WbZ/awAGDjotCcnMidglbTdcIeLM3xWP8gy4xIVD/+eh+GmkBb/yrWmxxmpHPQdu7
         33mnhZPr8xyYu9AZVS5IlXRRKl6nH3sRhHZ/xfgGlUpFtozypwIdDP8lH/N4C2LzLK++
         FMeLWmLJafvm2DC63dcnktfVyYXns6DQThXtxzyQbR12Mh8Yr8IGhSIdNOgGhYHinPY7
         Lh2SvDLSXMI1i2vRa1GVqHZAQVXEpDfE2cuzN/bGNzJimVo5bTLWIbI7j4QEEr1CEpZM
         +vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822343; x=1791427143;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxM9bT7cYjfTboFQvHDwSX62x29YcBN8kbWxUGtmO+s=;
        b=0biuezlo17UlSQQqsT/jchrG+XGyvv0F9wpSnrQmQ1ysHLQW8OtgtYR8wo2nhYknPp
         BgfyyjdYtZrhPMkplbq325GDMMo83mMTJkrTkE3l9IHAwWJem9+77cnahL5ogALsS072
         Nja7Ro+KsPAdGnNnBbFMVRkk2SJlt5sd7axtyrtp+S0uZKcvidLvveRpLAQJPLdrrHsa
         EsXSSKmn0OIuuOVbSZVYIdHrGeo2WWhl3YtQrKddVLIBMOST23dOLxMyicmVYRxQsu4y
         yQWUtjtskUMZgjMwWagzLG1dqvOhpmNy5FmQ44ErqgrDGgn6IsWXS4wqxUxZ+0q8ecGe
         QmcA==
X-Forwarded-Encrypted: i=1; AKwUvByOuKMJu6jyxAj3ZkgvN2aBNyViGp0G9Pw74pJ4yVDr5ga4zZgT/JZzMB4ffk8qUmGS+gQ65fbrbdA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLGzajSqgafBlPDOchpQq+lK0IDVTsihCJEzU5lzSgm7FIplHQ
	CglZBcH44jsVkNKULIWMuPeNCWAm/b0mnZaZAg3RC9QcPb7uzvwCvB06
X-Gm-Gg: AYBFou25ufZamuWFy0JiHkmlifDSV1Ekte7PZJbiQ9i/zF6GkUqXuWFVbazG//Xws1O
	H5tpcxGiVHmnwvIMYdevzL3Quu6sDD7ycssXDQjzWV2JdE8u8s2rRYgOpCRrunWYL03/UT+214V
	vBfaCYfp70n711YF0nhQ6jW2zCuDEz1IRvrW49zpBZzftxtQs/su4a+wnYf9sBPaz2qui51RsCj
	oJG2x/S/S+9wjjGZOTq64I+EToPtmhm20HUz2suhZon9oAX06ONWEo7mKo4U7wcMx36XR8qdfkh
	MNZuGSSkYBNORlKaoQvF8ttQW9WS3Jg5b/+WFf1a1vuV5C9kMWtmHMuf5oY/8ILXMyxWMgdfDJ4
	CctYt8DNVrD2jKP5s3VVgjMi55sFoBQbObsfYLiIOQS8q5ZDh2LuavTDDuWJkjGxDDv4sSIW6Oe
	2udKpxXN4ylgbxhhZRztsmmkx+pcpmzLtzcpKat1kEUzWYd3PA7aX67nQNPpuRUAhcdp7ViSYyf
	dk+aClQB+w9Pwjn/WVG+00YQ0r4vV720ByvKKVxFiVeRcVX4CXD
X-Received: by 2002:a05:7301:468f:b0:346:7bfd:8504 with SMTP id 5a478bee46e88-34cdd98c9d9mr3520723eec.41.1790822342788;
        Wed, 30 Sep 2026 19:39:02 -0700 (PDT)
Received: from [192.168.68.59] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4c1ca89sm2351755eec.27.2026.09.30.19.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 19:39:02 -0700 (PDT)
Message-ID: <bd839c03-5cd7-48bf-91a7-c8dc51e5f6e5@gmail.com>
Date: Wed, 30 Sep 2026 19:39:01 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom/qcom-msm8960-samsung-expressatt: SSH over USB
 no longer works
From: Rudraksha Gupta <guptarud@gmail.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.li@oss.nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
Content-Language: en-US
In-Reply-To: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/26 03:43, Rudraksha Gupta wrote:
> Hi all,
>
>
> I can no longer SSH in via USB. Reverting 
> dd0c03d685225cb8fc60c477417d1b9c3b05ba9d fixes the issue.
>
> Please see below on logs that I captured over UART (v7.3.0-rc5) and 
> USB (v7.3.0-rc5 + revert).
>
> Distro is Nura (formerly postmarketOS). Using head of 
> pmbootstrap/pmaports. Instructions for this device:
> https://wiki.nura.eco/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt) 
>
>
>
> Thanks,
> Rudraksha
>
>
> #regzbot introduced: dd0c03d68522


Hello all,


I have identified the culprit:

> CONFIG_USB_OTG_FSM=y

If (v7.3.0-rc5 + revert), then regardless of CONFIG_USB_OTG_FSM, SSH 
over USB works.

If (v7.3.0-rc5), then CONFIG_USB_OTG_FSM cannot be set to y. It must be 
not set.


Thanks,

Rudraksha


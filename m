Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27DE26F2B9
	for <linux-usb@vger.kernel.org>; Sun,  5 Jul 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783243209; cv=none; b=tSk35+AdUexOck5eJBcub8keIogd9dEzrejmHncknETCUJhtxCLeqbBsrXAfMIwtmQdj1uDN60R9Mz/QDESkFQs52j1jcxZ3MH1Do6ZYTXaFaNW621OeI+z4zhejFHMQr9zfp4ruswVEthU1VhC0kbgJjZXrk1rehjBMoBfVNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783243209; c=relaxed/simple;
	bh=wGeWfYR8UvMbPV/R9nOMmmPkqBblx/3UOn64OadHv9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMhPAZYElyz7cNcIsUwsKlWkE/xh91cT5TLVRQ1sdCYQAL9YBoIkDTLean2TH0xXojuzV8JLr90yrt13kbAf1XqbiX15cLwMDRIIHy4OxwNLD4UWBKS3YXiMVMCkdkteBj4//7xRSmfXti2SEZpBPLfcMu6UqhMO+DiulXT38Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDsyBeTW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDsyBeTW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b1710405so11115505e9.2
        for <linux-usb@vger.kernel.org>; Sun, 05 Jul 2026 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783243206; x=1783848006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Tvk/OZ08VEIUEKCQq+rs75MWgVCSSlrRXu8ljkh9I3c=;
        b=BDsyBeTWFYu6f9MJHYS5l7bvGpTIxeIELl4wvOLKLy+/3FKAqb4EMjS06PCbZbrYvL
         TDhqIdmqgEr1nUkqAsPrDA4wGBIW7Z0muBmypRWnVmtnJrS4HMn7sHOxxPpGgP0w/MiQ
         OdejrKo6y8yplzQ2d6tTh2dKIo2F6rZL0wHnDauGoAmc0/iGZ8QdcfD/zeqMVszm/2l8
         ziDSgjT9pRxb0YLwyrRuNbkMmIhiPWDZE9xYEb1nXOSd+ANKiL3ubYpGsyImUeNDMYR2
         cNGK23Wr45GUJ8Mo2KycmpFExSc88Ag8SeeKMeRHWiKPoUXM5pfv+0JAHBo9uCDdz/qz
         2nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783243206; x=1783848006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvk/OZ08VEIUEKCQq+rs75MWgVCSSlrRXu8ljkh9I3c=;
        b=r6jmxTXlrguJz0yjdE9HJVir7oaACO/dWwkPayje3mg+gP2JJ9yiqPvEk6WIEl0way
         DtpUM4BBOi2MXyDmaOKNZVcL9C29nhs9IZRzaEUUU29bCvgRz/4bgLMAfGAc0z7jOMEr
         Aldehr6uk6Iv9tTfTVEOzCK2iIKRnrVpms/LpiZc6RqaWQ+7mRdIOnu9KjglyCfkwWhY
         lHS6L4MmV7HeQDAj8a6YKSsLZ8ddyW9Rv7HxmT0BUqU8FZJbrrod0G+I+ZCnqIbLTCBv
         FkuLW04908vRqZCiGuV+Qup8YCqvsqWxf9PNZAEhpRK6/A3hKO/ZZ0G5T/gPYXUriHVL
         ZFKQ==
X-Gm-Message-State: AOJu0YxF0mTiqx9wcI1iEJwD5gPaziR3KzwY4EE6QjbmQ7u1cMuC8FEx
	Fv0TwLHQHmXcs13+YnyvMg06LyLqP/O0uuogwGxdKmZaDPi37Y5u4bdzGGKOxjHPY5g=
X-Gm-Gg: AfdE7ckZYIRNSjGDBJLc68jyUZjttNfDeLlwMnlDr1ZO/CCZWd3iyHES/6uElsRa+h9
	cT+/YvZ0GW0MqlwC527257ronZDMeBXeQ4Q43wFu17dUBJrnXOfrE8pce1QsWIvfkdE4mIjoW3o
	65gQN2z1elNSzn2cEU6DZh6hYTg0IlwYVhFn2oZMEhqvVXjnOstvGy9txA0YiSjjdGpJijhvnnG
	i+Gc0PKOdEZlijLoJhrsb1ZB9J30FrqVWvMbOw/dkkPMMwAZemRkM3FrzrNRQLtYePEapB4zUEy
	KGay8JycrWibmUye6RxvG1qeNa8S8oF6JC566tQOGOagZtimNXkC2jgmdhP7X+wz2z3w4uK1N69
	AxFWtghiEptuHXqSHbj5jc6A6fjbD347NmeKtWxMUR4xPWTtuTO4reF2iwmF6XYE6MImRV4dDqQ
	PVGHpm5QvpJa8Wmt1LDX1VDp1ima7TXCL1nwgodLG1cUPj7T17ya1D5sLk9d24bJIbVzU1JgP3W
	tu8NCkQ86aB0ZdJzGQ48Jo=
X-Received: by 2002:a05:600c:5306:b0:493:c8cf:27bd with SMTP id 5b1f17b1804b1-493d11f37e9mr70341335e9.19.1783243205962;
        Sun, 05 Jul 2026 02:20:05 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:b34f:2401:7bf4:2e18? ([2001:8a0:e962:d100:b34f:2401:7bf4:2e18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm486696295e9.7.2026.07.05.02.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 02:20:04 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <af9b60de-ff6e-433f-a757-ed7e1dca6caf@gmail.com>
Date: Sun, 5 Jul 2026 10:20:03 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
To: Xu Yang <xu.yang_2@oss.nxp.com>, Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260705065832.184-1-kernel@airkyi.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260705065832.184-1-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 7/5/26 07:58, Chaoyi Chen wrote:
> +	imply DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

When I suggested that 'imply' may be more appropriate here on v1, I was
hoping to have more of a conversation first.

'Imply' is safer to use than 'select', and intended for use when the
option is highly preferred (but not actually required).

Perhaps Xu could provide an opinion?

- Julian Braha


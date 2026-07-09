Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E073B14D0
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 22:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635196; cv=none; b=JLwxEAYyDUsg87HQvGyNVeNYEmF+yRND1oEcbKBZHfUu5WUynGNZ93YL7IQ9gFHeT7mJwVUvxrYv2l6VETgYnU/oPt//mNmGf7afoXrGugiDojnGx6dsefI68ZwVVxmRkyrDCUy7oSmhiwUleSyM0hP6Rc0mkFi9GyXobqC4lC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635196; c=relaxed/simple;
	bh=0eTYNlzbh+kIaRy623BfcosbEBLTuHWoTR/NIMNDK/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tB7HycBTc/9+gXgvJku4yqp4o9doS65QkhhW6SGqSbSf4mJye67PEC6WQBuLJjkRi0iL9+zmWTn8qCb7owHXh+9mKSIvJ1XHy5FzHyYeEuqR5w8P2j2LVDpnihww2fnqof1t+zwxqUATXHhNSe6YjUEPDA12dMTBo2dIg80dZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q+DdcA8c; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q+DdcA8c"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c96c92c0980so184871a12.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 15:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783635195; x=1784239995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBqXMmYpW+Czf210p4ltTJGXBH9BD8XV3lG4s6qiSeI=;
        b=q+DdcA8cDFL1WSrOiLNVjQXWmeOVCc9UMhh74amJAAhrw+OClSdvVJmBX54qxdpJqk
         HgTicDCKlUaTel4ZfcAUMRIr9JrVXz4nByOgfh/9v5ISmD4odylxQEiD+9JtWQDyzPZs
         DZ1hRIV928HWtvOKQrL29GJaDFNG55M/p1Og26zlveDF63TQEMRRDsHGPMRCfjGZZun7
         AQBfaTnzsowgwSYgJUpWRgrZ3eWvlA3sqanK49ca82ucSxHtczAQxyDKbTSmvOv8QLrL
         hjPI48ZZwghRt52bo5M2VvkR8VfnBRxSL42ofHr9HeOCsLkhAH+07LgsBXlgd+z40oYq
         /mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635195; x=1784239995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBqXMmYpW+Czf210p4ltTJGXBH9BD8XV3lG4s6qiSeI=;
        b=IetckKA3doaz8+GiGHV6o92Yx8ZxrWJb2Q/XSNRfiDESVDvd8GV9Ngp+zi2Yu8ADS9
         GHqdQGbFahCFOBST32n3HCpYmCoT4R/ui61AqBSU3s2+42JoyRr1Y5WL9X/E0xDDfz3Z
         NOis7r/H3mu09i42ZKGOLTGhuNf+Jmgazt94Bla5xQ3/GbBAqBM5hqfttBI+cUrMjD+x
         HGmK2ORvz5xZn6vem5pwzW6iV974zkI7HSak70/NTK01O+R2MlyG17fniUDSCZSWY4R7
         PcrXt2CTm0sEyOtvLMVV/ranqQrecqZta+yI1t36UUq8XYDO74/W20jQg008TwzamzyT
         vPiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNn28Oh3sHxaln9aMQYfV7aaQw7kJxf1eDlAY72K33f9LsJ+eOgzCgF9551UZthwBzUoIXhxINV6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDNcJ8I5vdSDtS9X5nvu0Y+/AYgEUZ5SnDhXpmftE1okpiPS7
	Mt0ahKtbsVTPaWh2q4NXxNQCvfQVdXn14hGujHYVFPtnC2hEtiSt6pNi4PD0UTBorA==
X-Gm-Gg: AfdE7clsHZD2Fg8EJ+VJ5Qt6v7XUYZTGQPt8EblvYcqtD/1Lf4/Uuri3YPIrdVMPWj5
	XGbM1Jm0LmzCL0sOeOEO7N4VkGYoQbTcZ4fzEZ99y2JLg1RHItyN1hSR1zqNm89Nj9hb4rIQsH3
	63UG6V19tR9P6vF9dM3lGfcTSnvOhY1gUuKLDxGFtzIJf2A8QNXDaJtJoNOJzYmu3vZAJnFNG5E
	Cfh9emN2LqGZrTDx6xsUAaijscHBLqtZv+ZFzAEn/orM3K+KeCdcAJAjeOWiAHJ4yxlMKIBQ/lD
	NunhI8TfhTtZm2KjJIBwPPGMPQmd0F6rYW6vFBg3dNzCP8oe3fcNSU18T4BnxYwsw6/7to1mn8Q
	5Y1NGGnsdo+m/j82cFhV2ANyTX4RORqTpAF0LekwFjk0Fx3nRkXq42LYtG3Z7X6UOhCJ3It0S5t
	wpDINVcBpnfPPildAQ3lIDrRxVYQYhZljJKkYKecph/RgdFT3RlfJ57hJLj9g2IVYM36Cl6NlDL
	/Ryk752FKc3fidtsSuLhvVkLO3Fj9Mk/75d7VCC33MPlXw=
X-Received: by 2002:a05:6a21:a89:b0:3c0:9c19:b27c with SMTP id adf61e73a8af0-3c0bcce9962mr10814503637.74.1783635194306;
        Thu, 09 Jul 2026 15:13:14 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:973a:bff5:6198:4261? ([2a00:79e0:2e7c:8:973a:bff5:6198:4261])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm13470044eec.25.2026.07.09.15.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 15:13:13 -0700 (PDT)
Message-ID: <d0fcf5d4-ed39-42cb-925b-47f72c67f49b@google.com>
Date: Thu, 9 Jul 2026 15:13:10 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [usb:usb-testing 23/28] tcpm.c:undefined reference to `__udivdi3'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>
References: <202607092212.lINETdSF-lkp@intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <202607092212.lINETdSF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 7/9/26 7:17 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   472ce6621e371aafc03c0704d1d940f51d8159db
> commit: b3c9b6925ca2e02ef2fd77d0aa5e0ca6b2a67f5a [23/28] usb: typec: tcpm: Add support for Battery Status response message
> config: i386-buildonly-randconfig-005 (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092212.lINETdSF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607092212.lINETdSF-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     ld: drivers/usb/typec/tcpm/tcpm.o: in function `tcpm_pd_send_batt_status.constprop.0':
>>> tcpm.c:(.text+0x6743): undefined reference to `__udivdi3'
>>> ld: tcpm.c:(.text+0x6764): undefined reference to `__udivdi3'

W=1 build fails in 32 bit architectures as I have directly used "/" 
operator for division in my patch instead of the kernel helpers. I have 
a fix for this. I will send a new revision for the original series [1], 
hope that's okay?


[1] 
https://lore.kernel.org/all/20260701-batt-status-v4-0-a31d97b1ae57@google.com/


Thanks,

Amit

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

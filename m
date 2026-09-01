Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17770317163
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265079; cv=none; b=Hwoy7JMf0zLgjMA3pdK5jMU5xH8DFyJtPf5UHSu2wGq6MKG7lNLVwCb8RLjFc6YPArRpUXTwJNfNq0/+Az0dzdvDrRgMBZKC8g81rcyfnwO9EUsJG6PjfQP/E4yldcnRy9x3nzhycekUgL+XPR16H7GgyG7Bo/j1B/MwUCcbNWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265079; c=relaxed/simple;
	bh=SzCRutQlS/1vZ4F6M4z8R6rASLyArMeEGpVRwgSj2VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3e6eHmz5/Y7uK070W5yhjH3WHlrYbyzGojjUfcfMJ5DNB6gOz9hxbr+GN56hAFjFVSnbXY37VrjsaMVlR3C4mxS0TkH+Vz8wExiN21dhmuhFFTsauWk9rI06ugn21mPpkRW2kVJLwj/hssxVxfNwtlNpfhTxvju4hqVWOwo3jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b6C9v4xc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b6C9v4xc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b965570d7so9006735e9.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788265076; x=1788869876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0XRAAsunpmX/3gLlcIV5O7uA70HAg1kaSiA41/S29s=;
        b=b6C9v4xcgbROURz0qxNSAHOa363wGXNiFqHpdMGqvJqjR6Q7JDjffcS0/kruMclB2q
         xbfx6sgLhgLbqbCVNpe/BzNLFl5s4R0y0Jr+7goD8FIKoL8s8Lh9kWzJ9uDaNinmD1sd
         +ffSfTjBLmfsjmBywgMwZNn/0USBSXTiwWGp8USfziXZFHbSZhWpFKjV0XYTga+nlkc+
         4YaIT78fjp4nsJqgc+heYMgVWekuY7mxtCEWL66vGxQSOaqncXHq9Erop0AIn3OiTA+J
         +pFmVjohYSdVdSyth+BHjenq1zmLHw/eppM9yeOx5RmvRXUXY0p7MJEvebZdMmPFWpRc
         nV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265076; x=1788869876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0XRAAsunpmX/3gLlcIV5O7uA70HAg1kaSiA41/S29s=;
        b=HuGJoHzHbcGfJUlvlwwkLaaTP9tbSyvDzFTN0O8bop499oMIDfdPDlobQn3h+lfNQk
         Rb9XmaUv/QwrowDg1MxX59dsjVWlQHszOyILU0Y9xwPMuhYp5YOhoNDnQuUDSNkvjjmq
         uAt8vSuyphfoEsSQGVHHPs6+IkUgHuDwyylkS8E5Fg+RfoPy3ZazRJaJfUiZBw9EE/aj
         2EJR9H7amaimhqmTHkhc5OFaImSRhRm3ljPjcnL1CF+xf9TdDhN//ziTE+NC60xbYzJJ
         ivj3xlbM0ZTPl9Nm245zGkqbpnDuHGILmyVz3ksyaUZaHp32Uh9UBkCuOEEFI3qoq3k7
         5MPQ==
X-Gm-Message-State: AFuF++nL/+UPbiOU8HImHhJm4Yr9cJqJdrG6OM4impUsVYNJYsItvo1Y
	RoFv4V9VkUySRV7IxsdJJrENuhELBUhyljIkT9xZrSaef9wZP/i80BqRwxLsN9WrgWsr1FL05e3
	VUCxLpqM=
X-Gm-Gg: AR+sD10/YlYGTeti5P9kKVT1W37rRaGqQ5H4HMQVWBIbnFia8Rhk8FCb/BeNHDtTRvT
	1aRT+h+Q+zHGvv4W3hvK7tE+gzCrs3v4EKoAUdye7AMj4Fx4vNTZ8whZSNxDY0JI5vW/wULggP4
	JCgFJrN+tQQ+GC9Al2qUkhppSkJFy7RTAMKoDy/PGBklvJv9g/5Wjuj9hpmrXfkXgy5mBObI0Qb
	ZQeLrHm1VEL8ypcNTK0FQa9Tp9+6k4NrEE23iyqEwHStErEd7sb5W9r/GcPIWLs7QNhLB3UOTwn
	QzfnCeDkEvvgrHue7Jy09Se8jxDxU6bSnyVEijbM52Pb1sBATGXdC9jPXYG8Ly8S4EgxMcjI0QZ
	rIsaFZrE0bflfCLTyMXE/2k6xzmMO2maEvdUOILtMwDIljCoD0GidGyadKS4VhGecjzCfUQUIEJ
	XPQzz3R/g2Nx2Pk4tsA7Zd0RhQzBgs7huHpiO3N/QMIhIDldxSnGCUdqjPOzxnm1gXQWUUfwzhb
	3is/9jbrrw6YnCEr6699BFXUw==
X-Received: by 2002:a05:600c:5490:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49ccf18498emr365099655e9.12.1788265075917;
        Tue, 01 Sep 2026 05:17:55 -0700 (PDT)
Received: from ?IPV6:2001:a61:13f5:3c01:dee6:bd49:2b83:2f74? ([2001:a61:13f5:3c01:dee6:bd49:2b83:2f74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8b9a2efsm175980885e9.3.2026.09.01.05.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:17:55 -0700 (PDT)
Message-ID: <0ff47679-3f00-4cb4-b1ee-2b3a0e15b13a@suse.com>
Date: Tue, 1 Sep 2026 14:17:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: mdc800: change kmalloc() to kzalloc()
To: Griffin Kroah-Hartman <griffin@kroah.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19.08.26 12:04, Griffin Kroah-Hartman wrote:
> Change the kmalloc() calls in usb_mdc800_init() for irq_urb_buffer and
> download_urb_buffer to kzalloc(), avoiding potential stack leaks if a
> shorter message is received in mdc800_usb_irq() and
> mdc800_usb_download_notify()

Hi,

thanks for the patch, but is this the right approach?
If we get too short a reply we shouldn't process it
at all.

	Regards
		Oliver


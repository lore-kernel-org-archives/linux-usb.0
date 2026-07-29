Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F53C1D61
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340471; cv=none; b=sFEC4U95+F4txnxk/bwi4peEnyVDuZxTB70R/+w+cuKhZymEjIVt0rpR5PD48U6piyZHBcVPGxDl2cROr+5Ju4ClxFwptsrHe4VAp7EvYkTYuE8KkOV9FGVM+IbQCMI4R2KgpIPHrf7DEdCx7B10vXJH+kRUoo4wDv4cT8Gtsk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340471; c=relaxed/simple;
	bh=fnMegJnhhOUYdbYE5tmDAmeSa9OiVBcgCSeB/AcxjL8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hLcn11rfMAGedq263dRiqZyC65gW9xQOPHkt6K/znyHlGFikc468QUmB806F3ob3UDA7PvsYtFUiZWFQR7Wqe/lvVntS9Jhh/BnPBdSqZsA5V6MVECd105UUZStEA9NxbYXbQhEwj19f4UY+YExZ6WYBThO9MSZoICh0HxFV3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmJRjuFX; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmJRjuFX"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92ed19f4d60so1493885a.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785340469; x=1785945269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DSfhWQtXvQe8cxVgaGN1DW6z8MA5Q1vbD52ycnDDbJ0=;
        b=YmJRjuFXllIoV10ZSMryJEOzQfmjSREVdyeoUg492EMEXdsZYuDaWTUO5rvfLWBvEk
         UkAnXHymv03r9Uq847XGkktLn8gfZI5GqkluSVzd37qSgJUk/7u6rjbG/JUlWVJRBNei
         SjuHnm10Mu3KaVUDzgBMdvKtMfBdu8GmbpV+3SvOWXpi0t/AxRZ3GiltB4+rZ0xMOVF4
         ST5YK3g/GBbjGQs0at3naJPI6RnqMNK9oGDnQWBSCB06VVjI0XR8Ngm/XCXW3M5VUNMR
         2OPTcw8XXUn/Ix2yE80DRc9rrZyhx/rQsNpp81MzvAUOc27JezFOI8kBykUpBsbJW7/W
         D9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340469; x=1785945269;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSfhWQtXvQe8cxVgaGN1DW6z8MA5Q1vbD52ycnDDbJ0=;
        b=Y1GalALxU5gozkmSeQ1TIXlAd3F03EvYYufKOq3MSrc2x7ZB5wbnW8Q2qwvSJoK0gS
         dQKYZepyCq9LuVJYlbxxHnZ+5qaGLsEYtXFEfqfpRGvIr2dnCQKDrGryfwwYbVKbUezW
         Da6BLLHoLob5FHPx00SwbiwYFGDatdn0eRfMH7+/todabWQ+867HQveDzcFRQSRNXSTh
         ygNKPk0fd+JS0i+RSMgD2j8XqHo2BVmuq4QmSlUztMLj88wNNRXBHe4lym15J9jhPeJq
         Zy544OWOVs5Abdbgra+BoT0b74o5hmWYwN83rj2tqpsIQrdVW16dyCgJKi/Quri5SKlz
         zxVg==
X-Forwarded-Encrypted: i=1; AHgh+RpV9k42G7WZuPY0q7ZjJ+mpLFvQ8Q03ArMEZLJdcXB1tLDWwYqDAz9vYU3ixtMij5ikdmQL/2XBKkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUvD3tEtSCL2VqT1WgG6Xh0SeIxRNV8hQZ8iOJVo9p9s7aFjt
	BPjX9R0SS0/uF3BYuhwFd6jO6yvpO0YZlrbndi8olN67q2TSgKmMFoa0mpbXTx0=
X-Gm-Gg: AR+sD10SuOiF8kK9WLe3lOtkhKLWLTB6E7rB8eK7sFZnUofoehEXFCs8/twKMMz+GXb
	Z1t4Hvo64ihE0LtoLoB+LhPyb9RSfRRnkxDmcJaOR1bNHWE+nG2jLEOHvHYQDLc4U0uTp2YyCSM
	8N3ens3n8WoNeW9dbyBizcNSgFRMcQtgiEn/K8Wpx6L3Qi17eQHTbC8fV5c6RsPSVagPktumTS3
	3QrH0a4CDsYNTD6d2h+X1LEFxkOZhMzTbhCyMjDAcbqg86Ou0MWzhOGVgV8sHciM+bfQnbDu5P/
	2WHXRx6g5YrroMEHLSAyjR2CW52/mO9qbIo5L0rZ2d08XHgjooqVM/F+GCzyA+U6C6Zc1kdpXZ1
	RIxJDA68xp+oxUjbuP0EKddufc8J7bdaYaXLieOOO1jTHDAmG+J2x/bV9NurICKu7713LOtrbFr
	LwBaq3YkPrS8lwjP2YhfPSliEI410v2qYH+QX4q5YOo2oRbE6i1Vv4nXpwH1pMOju8u2f+RQ5Au
	rv0I+Syq+hxHjphyQ==
X-Received: by 2002:a05:620a:40d1:b0:92b:67e6:4b79 with SMTP id af79cd13be357-9347985f67emr265448785a.35.1785340468774;
        Wed, 29 Jul 2026 08:54:28 -0700 (PDT)
Received: from [120.7.1.23] (135-23-94-154.cpe.pppoe.ca. [135.23.94.154])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3378db0sm197069885a.20.2026.07.29.08.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 08:54:28 -0700 (PDT)
Subject: Re: [PATCH] thunderbolt: Initialize ->domain_released completion
 before it is being used
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20260728065222.2550284-1-mika.westerberg@linux.intel.com>
 <20260729065554.GA20844@black.igk.intel.com>
From: Woody Suwalski <terraluna977@gmail.com>
Message-ID: <3d0e3639-87cd-5289-eb1c-40293d8ac9b7@gmail.com>
Date: Wed, 29 Jul 2026 11:54:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101
 Firefox/140.0 SeaMonkey/2.53.24
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260729065554.GA20844@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Mika Westerberg wrote:
> On Tue, Jul 28, 2026 at 08:52:22AM +0200, Mika Westerberg wrote:
>> Both Woody and Marek reported following crash:
>>
>>   BUG: unable to handle page fault for address: fffffffffffffff8
>>   Call Trace:
>>    <TASK>
>>    device_release+0x43/0x90
>>    kobject_cleanup+0x3c/0x180
>>    icm_probe+0x19c/0x550 [thunderbolt]
>>    nhi_probe+0x1a4/0x370 [thunderbolt]
>>    local_pci_probe+0x41/0x90
>>    pci_call_probe+0x5b/0x1a0
>>    ...
>>
>> This only triggers on the error path when icm_probe() fails and the
>> domain structure is released, it tries to complete() uninitialized
>> completion.
>>
>> Fix this by initializing the completion earlier.
>>
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Closes: https://lore.kernel.org/linux-usb/amdezCBiW4fd_DuB@mail-itl/
>> Reported-by: Woody Suwalski <terraluna977@gmail.com>
>> Closes: https://lore.kernel.org/linux-usb/62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com/
>> Fixes: f5cc545f5969 ("thunderbolt: Wait for tb_domain_release() to complete when driver is removed")
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Applied to thunderbolt.git/fixes.
The patch seems to work OK. I can see 
|/sys/bus/thunderbolt/devices/domain0/.

Tested_by: Woody Suwalski <terraluna977@gmail.com>

|

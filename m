Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECE2989B5
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 02:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502469; cv=none; b=SWIE7loY/7iYN8P64KoaGvwPkOq3sHtQbkzAtdIA5nW6R2qrroUku+kJ63P7k+I0AJ5FcqMLAuH3r3nKUoPF8MExRUsS/yx9WVDiPcrhwZO7o7MYnxxQQIfyIZaJcLolqgCBZ5lB1U5pnLQGs8reVyWgIMynNKVNGxwEwDWnXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502469; c=relaxed/simple;
	bh=37VMdUxytPiKD/RJADwOCf4HSW0rsdJG6Rkc8HMGe9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yoo5krHI0Ud4AnigLtR1bs5p5HTvL98oIJUoJAm2Bn/yQi1NwRyjW8uHnpOqvxGQELRTqa/aDVKq6pzVkDMssRL6uXbJjtkeNShU17GDqJ4oP3wtkxDRosvGvCYjLv2J1mZYis/MlBkpOKg5tlj3tIDOYgU9QwYTGOwkn6D6poo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djNivMvo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djNivMvo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf50c6f235so8284025ad.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 19:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786502467; x=1787107267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lanv+kqXaRyeIzc5S81EnjUM67Ox70p+DZLgF1B6Q9o=;
        b=djNivMvoIRz1PA3xGL1A3TpN2QJdXpIxnOXUsxOMrvg6M/K08tMndxWxzzqu337p/E
         oCu78NY5w5nepRdNGbvP2PguLGeOYxb9ng24EpDlSOyPVb7JhFR/FgtMFw+TGqL9ApPL
         sRmEOCEqNzYE6/ur44Y9RakfbNWVjjEX4kM4tMfQLv+xLfC4gTcvtfOLrxTTYTFGu2Gb
         Dng8fGBzTlmJFl53JV4s4wex/DAwd9eJ/5ZC6Wj3Oi90QbK/dNIZ1tQL1rJRcQMOH+la
         yn+z2isdIBDir1NL2uCEhbrco6iyPbyiL0PeA4wm1EWYx703v/nDKRh1fE3CGhmEVs9o
         emCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786502467; x=1787107267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lanv+kqXaRyeIzc5S81EnjUM67Ox70p+DZLgF1B6Q9o=;
        b=Z5R0cDYjoTMCNaOrnHY1l2jVm82nGNYMOApZ33TWtBIEyDGhW+W3phf3ixq9XrZz5n
         u/bImH4dXeeHVUY6t7YOzkduavHKcjHY9pKwmWsLAfQnbViIj4gGVXTB1MxObk/U0P1e
         fpjqEeC2FsM1qVAHQDEgetoFzdTRvQKh7CcMdDSk37KaflP8eTJerolXJtLTlEgqwBaF
         JCvVpzysc7pPTq0Hzs0HvMvmJxq6Wjct+r5nxiaDrQfhWHuubhWldPK5PWwKbn0v0+U0
         Vee7X0VJSS5AEdfBERFHcErb3PL4v7R/wkpXG9wTRN/bOwE2JD7iV4nN76zKjY11SBpo
         g2HQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGfsC465jvWmjZQIWbGYlOW0HHp9sZ8a4NF+Qfj2mnUdK+8jSZEP5HVM78B7tauDE8chVZ6EQnBvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfLJ4HFgZA/gGl1r0H8xtzhK1GaDv+2ifPq4lODWM4iIeyH/R
	fEg7XAUa7ZIZliQIUor1fZGdbYokbYvvsZujUeFlUhCLKIBGsnYbTkj6IulxkA==
X-Gm-Gg: AR+sD10vN0OlDdh6lj0D9t/drL3DdhFK4WzBrLpNaBSjKME4mkjN+0527rcmHV84AUh
	a5dFWVkz+MN4pYJai6wmnn8Xy1DNvUha6Jp31p/PxjfdLLAJjLWXzxbMec1pkEC+JL6JDxmilKy
	gcU9NEQ8QPjXI9u+BWHHQ1qs1qgJIV/mf0yMyfdBZ5o/Lk/Z7cF5FaX771/9oVpv/5TWwPccZEp
	UHhJDNdkKkeTZMrM5aijelArTOPk5HBAJ9YHEn+EQAgiwcdUFSyKJaKzx8gXLoPZc+OT2tS/SZt
	myszwBPqrPVEK0na74KXSIrMy8TBZHW9RLPJJvkhvhrzhBWkSgZsfgumTy9OG2LgVLsoWmFW4h+
	cmRzvmQGCs3kcH6GjcjfADztV0ouEp9bMPerC4nwIlvRxX+od4MC/y6Uz9r6Hts+pEeL9lIQm5+
	xFs8h5pPxHjknynzmtP1iIIhVqDEz2d+TuEftveHDSbAFG/o+N4BMKElMu1P3zrIMZYfiRRp25P
	n0=
X-Received: by 2002:a05:6a21:2982:b0:3c3:a41f:ce7d with SMTP id adf61e73a8af0-3cc3f1f5dd7mr1909572637.0.1786502466733;
        Tue, 11 Aug 2026 19:41:06 -0700 (PDT)
Received: from Default ([2409:40f4:100e:be9a:465a:ee31:5561:2b2b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412448a38esm4632210c88.6.2026.08.11.19.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 19:41:06 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: skhan@linuxfoundation.org
Cc: gregkh@linuxfoundation.org,
	i@zenithal.me,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH v3 0/2] usbip: usbip_host: remove legacy rebind_store in favor of drivers_probe
Date: Wed, 12 Aug 2026 08:10:50 +0530
Message-ID: <20260812024050.11267-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e3473010-e995-40b6-9040-e38f51d1a6c9@linuxfoundation.org>
References: <e3473010-e995-40b6-9040-e38f51d1a6c9@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 11 2026, at 16:53:23 -0600, Shuah Khan wrote:

>On 8/11/26 10:05, Jeffin Philip wrote:
>> do_rebind, which sleeps normally gets a mutex lock. However, it does not
>> or should I say, cannot check for null udev between spin lock dropped in
>> rebind_store and entering do_rebind. This is a potential race window
>> already. So, even if we check for null udev under spinlock, we cannot do
>> it outside. Regarding do_rebind, it is called during stub_device_rebind,
>> but that function is called during module exit when all files are removed.
>> So, do_rebind is not designed to work in a concurrent environment in the
>> first place.
>> 
>> We have a safer function that can already do what do_rebind does,
>> drivers_probe. So, we use drivers_probe to rebind the device rather than
>> use rebind_store.
>> 
>> usbip tool references this function immediately after the device is unbound,
>> which is safe for the tool itself but since we opted for drivers_probe, fix
>> it by using drivers_probe rather than rebind_store after unbinding device
>> which is more safer.
>> 
>> Tested and working in both userspace via the tool and manually echoing
>> the busid in the related nodes. rebind node is still left active with a
>> warning to use drivers_probe upon encountering rebind_store.
>> 
>> Thanks,
>> Jeffin.
>> 
>> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
>> ---
>> Changes in v3:
>>   - Removed rebind_store in favor of drivers_probe to eliminate race
>>     condition
>
>How did you find this problem?

I found the problem on syzbot and had to reproduce it using the following
commands:
link to issue: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
echo 'add 1-1' > /sys/bus/usb/drivers/ubsip-host/match_busid
echo '1-1' > /sys/bus/usb/drivers/usbip-host/rebind

>Is this generated code or did you write it?

No, I wrote the code myself.

>Also, the first patch removes code in rebind_store(), replacing it
>with a pr_warn()? The second patch points it driver_probe() - what
>happens with just the first patch?

It just prints out a warning. I did get a -Wunused function warning
while building the kernel for testing and considered removing it. I
ultimately didn't as scripts running on newer kernels(if this
was merged) would break as there is no rebind node. Should I remove it?
and is pr_warn not the right way to deal with this? If so, please advise.

>Did you run tests to see if you can bind and unbind devices - does the
>driver work correctly?

Yes the tool works correctly after switching to drivers_probe. Devices are
bound and unbound correctly.

The function also caused an invalid opcode while testing in an unpatched
kernel with a different sequence: write to match_busid, then write to bind 
and rebind, followed by writing to unbind.

Thanks,
Jeffin.

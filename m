Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C42B3BB115
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350985; cv=none; b=PioYxqmOuiONFej56NlVJFt3bOGfT8bVy/C/WqmlqjXRdldckLLerT7MDYzSQyymY9Y3r7xxhYm0IOaXtgx2gabOs4gWELmtU+0y0OF2P4mGoKFj5rZhEPs85sfNlJUtXUSXm3u5U0kzbX+xbzArIF26GsvKXAJgV+LC06VY2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350985; c=relaxed/simple;
	bh=GTLCTugw7PjjvVnLCGl/oOTPq/b39jKFstNMsphi4vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+X1T+jEPJwrf0Dc83uLaqzww5YJz/43dD4zGxD7fVgSHX8IBZj5uI/cA2mgt1OE+apMZIG57s1PeQW2zekvkZCenjwnFj9tdNK9vK/6wGC6GoigEKYnxFEF7VxodSy+Z9SxIuM2ZdPUATSGyMxW9WwmYwtuu4OXgbuBHwfH1Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fx9WXIjc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fx9WXIjc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so704788f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788350977; x=1788955777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpv4ZZhQaX1kdYbkUZt5Cm50+G2KZgBu15PDYo6wGO0=;
        b=Fx9WXIjc9tFoB+puGS7uNB+7hiVoiTnw/bXD8PoBgNROG/eDIV0ogbpD7WkdmfIoph
         eyaCG1UYCyuu/DFeMW46YqPg1Jk1/duzRSRsBJW877JWSksGvz3ze01zhJyoW3pHla2K
         ffHleycdGK9KpU+lKApuGpLylXbWuneU+bDHTogu+VESouaUAdnSFHnaBsbBVK3qpSzv
         SknU520PLpW3QZdIObCmM7DR3pCF9fDxz1yLQR6ok5H8WlgVZz449rmoecS/gdAbtwsQ
         Gxp5SYGpJZuM7ZmOZx5sRDQkK41Jy+bwr/oJVRJp7IFX8UaXEkGNhaKaDQwrEp/MVyf4
         zOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350977; x=1788955777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpv4ZZhQaX1kdYbkUZt5Cm50+G2KZgBu15PDYo6wGO0=;
        b=rquBCg2ol9Ou0pQKASJQl6Y9EPy89mvWBH3zIQ19wAQWHRnmTtYlTxcqnFSKwuC3UK
         hSRxXR5WCy0ZGFoUXLbkUhZJX6fIIRHqO84FZMB9cOHNme6Tsc31UjtmONP1JuxQd0YG
         HXefRFnVLV95e0Alqh5lvoKnFVSIbklSTo8Vkr0+kSmTAGjZs91uy2VTfF43zASDVSIv
         Ii1ScoRm6txFIKs9ezEbaZTCp18eqb3fbRdjAp82ilHHbtyXfgv9arRyLjKa+JempY/4
         eGn0/t30QSfT1Ch4e844QJHtMZrEt1XP+dIXPohAFqbEoJFbGxfWtfLVlPSiyz6hHxXL
         5waw==
X-Forwarded-Encrypted: i=1; AKwUvBwcxMk2M5Ba3MjTPXJmj3A8G77yKyExs0gS4tgwcedGD1qaetqx60MLeWZfyTWJzNyqKLRqdWOhtN0=@vger.kernel.org
X-Gm-Message-State: AFuF++k8H8H7pfI122p70gKayag+774yONBSH8oyUP939N9WMvfvQyeT
	vZBrpQgZiFiZ3McRdmCLP1+mY/sitUSZBY46/FkyyCegCRLsH3WBCrWp1nQycoOO1hg=
X-Gm-Gg: AYBFou0RmBgkU2trRmAsxTjRWTzI+WXwwdCk10VHWXlJ7s9nH6S/QHKb5fRR0mTJQny
	H7IezImpbwE1vQNAu9cmWdI35sSefjAgDTIYAkR1UyVF1Lpmhc+9KwmtrlZ9XE+gdztV6XXWwnN
	fE5mx++dDTCDdhggu0MdZ8TswxeCgONdcD1Chn4QpMz45gezMsrfEQBSsWMsfWq/7WjnNu4sTH6
	V7Bq/be5Ic2IweD+ydYuvqrSjyfej9pC2mzxXcbKnPFRTIPhSaWckakIhNC1vbnzsgcHPYVeyro
	LFEYw+zNWC+DwYyx2wN4h81pqGKPPh7TbUD2el/z8r36zsVSIj2TF3OdcHFG6qsfgM8+d16G4AW
	1s83g+w6IwXYoAslT6cCLm+AGC40jrcjeOR5Z0RzJEgFbxnBDjz11LPUIn/DvhvLNor/lFHiYFv
	v+S1HB5Xcz5hO3lIOvNeSGJWsxgyoOlO/JzMz+L2Q1Q1SAPRA5xyIQk33janiXqn4xepBYcWUwg
	HNj/GWpPn6BpoLrkz+0VBR/SMUCEaiV3dL0jibk
X-Received: by 2002:a05:6000:61e:b0:484:36c8:ffde with SMTP id ffacd0b85a97d-4847b625aafmr8604788f8f.0.1788350976883;
        Wed, 02 Sep 2026 05:09:36 -0700 (PDT)
Received: from ?IPV6:2001:a61:1304:a201:f0d3:bdff:55cd:3f16? ([2001:a61:1304:a201:f0d3:bdff:55cd:3f16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm6073105f8f.2.2026.09.02.05.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:09:36 -0700 (PDT)
Message-ID: <c79e754b-2ef4-49f2-8bb4-60b36ab9a36d@suse.com>
Date: Wed, 2 Sep 2026 14:09:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] [input?] KASAN: slab-use-after-free Read in
 k90_record_led_work
To: Jeffin Philip <jeffinphilip14@gmail.com>,
 syzbot+0b8bff5929865345b29e@syzkaller.appspotmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6a937393.1d9ded08.62e62.0113.GAE@google.com>
 <20260831054632.18179-1-jeffinphilip14@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260831054632.18179-1-jeffinphilip14@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.08.26 07:46, Jeffin Philip wrote:

> I believe there is a patch for this already[1], but it has not been merged
> yet. Was written just as the merge window for v7.3 opened, so might have
> been the reason for not being merged.
> 
> [1]: https://lore.kernel.org/all/20260817072831.139954-1-ccc194101@163.com/

Looking at this patch the following sequence seems possible:

CPU A				CPU B

enter k90_brightness_set()

if (led->removed) [FALSE]
				Enter k90_cleanup_backlight()
				drvdata->backlight->removed = true; [TOO LATE]
				cancel_work_sync(&drvdata->backlight->work); [NOP]
schedule_work(&led->work); [THIS IS BAD]

Just cancelling the work is not enough.

	Regards
		Oliver


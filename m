Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF73BCD05
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785968622; cv=none; b=Q+EqEZhQbbuuHyEztN102BGX96Qjru+Tnxd0T7KtHc3NJCDugmlyB394/Ts3noPp6s2P0qeQN6q8EpTfqREkEzg50UGDISHrcH6+B6ZkUSTzwuVt/T5gMqvVEQTgep03kdfeBPjg5Lm7sYXqSfCJ0Wi8QvOTo1w4d6a+lTzhxKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785968622; c=relaxed/simple;
	bh=wSEDcmED0jbuDXO049ZllTONQqR85W8thMwxaSCcUEw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nStqm973ni8GJ9FZdzh7Fv2ntG7LOWTvZJlOxyCoE5E4r9l3CPgsGe8b1kKEEbgMJ/ZJf1YRnOisF/UgbWATGcipuaSIVEHmn3ahrdbAqpZRY5fEg+3ayCASLUk5qcjMoEomhqZ1oFC9XVBR5EiPC5oal3r5ouR0pQuah6kkLyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJ9r5lQg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJ9r5lQg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso7577055e9.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785968620; x=1786573420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=riKUFVX96CbL13ka6UjD8qs1tauFE6Kn8Da4pTZBX4I=;
        b=JJ9r5lQgq2n7jvdboaBZ8vNdHudMHwT+QL5jEllHFMO8wsMkQUGSOIDZdNNp93r1u9
         GzA9KSq8a6tBQTnBfSrKyawf64M4/zm2inMnkuIJlKsUwpFKjJxPLDVV9v+9kRDLahaS
         EaHFsBuTuV1a7fJLJxYQ7PVsVNUz3927ITxboQXPDDAEbI91KQ2o8z3P98H4ilgIFrl0
         HAmyi3BqrbVBYekeSSV80WsoysBL0uNLceACx0crMEfnt/x/94gpVOj08CEL4TKH3GE4
         FeART9+kbQT0R5TXj12BIbm8n5+hkDqM4cIDWsJMMZp08FkTczdUNypX7ha7SQs8gqDX
         ch1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785968620; x=1786573420;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riKUFVX96CbL13ka6UjD8qs1tauFE6Kn8Da4pTZBX4I=;
        b=YS16XuOCekm5IOec9bOitC7n51wtKUxqVX94k2AMbByx+OuJh8r3dARkYCM2AYfB/v
         3MvdycjuAkTHD1olWA3Wb/7cxwjo7Drr+/uopHNezv3wLz6RLg5H7mtdhV6ZhPDECiKe
         A1TVRol1OV57v8SrYJ08yn17Q7TbKllDrIutePirT/b2j3I5HhKUpGiY3mFhZIHYozGq
         +Nn5c+nLa3GdAXMxXOpaNxQlGwvxh7uR9FwoJbj5ygT7jZlfKcQkMDaWV4I/hY+yhjp3
         sqZPyjdQjJgGceR6zQBwkZsyHuatAboAo3lbqAG4wtPDDRIlNLN1K6pqohFFUphKNwHo
         7AgQ==
X-Gm-Message-State: AOJu0YyB/dzlPBdav835Su63O0U0Mj9/ReMd+wvLx+CzF9tRvrlnNfhH
	uoVjr6qc6hP3k7bjKGh2upns+VF9Je7WNefF8HrTHa8GXPyFfJoy2dQQ
X-Gm-Gg: AR+sD12c9x6+64yF498G/rhOCpLOtoQ8u35S3Yt1eaIrYlgO3CpLhMSxlSOvKeCrguD
	i7QnkIKIcPTfoDLxzBanuwO5IopaRuecrDlnsiK2Zro+/CHexGE4yJ10Vdg/GVSo7b/jf272bhf
	CfQiHsplPT0yxxvMe5YBeQ6g4YrbLIE0b5dDSrg3LJKd652bX5n7g69alq+lCfmhekiUmKoa3Ae
	x2Fqu432/TyWt06UUF77Ly+mGKLB5ZZBZcYjtuRFsQbM2r9JIumhhC2YYXEco5WgLTKmATgApm8
	4POQayf++b8k806f3pG1m3BtrR4RObYz/AISFlYk+uzMdB3YTsJM8s1QWZOWbnH6CZ8WJOb0VIY
	uIT7U6pNQ8rit1iVzmC9pM70oLrVK8EKdOX5ghlO9mZkUo09t+wqUMyz2fppVgaYcCkELWFyiVr
	d4kbu3krEIPFycwHKj0wlPjXFGlTaFjQvm+p/NQedX2VkZkSs9T7GbsHdY8jxDPoIo9ns2zyZX
X-Received: by 2002:a05:600c:8b35:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4994e79e668mr126694925e9.7.1785968619685;
        Wed, 05 Aug 2026 15:23:39 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a72f6sm804608f8f.2.2026.08.05.15.23.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 05 Aug 2026 15:23:39 -0700 (PDT)
Date: Thu, 6 Aug 2026 00:23:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260806002336.6f968841.michal.pecio@gmail.com>
In-Reply-To: <anOiUYwnfuXC0lSY@spiral>
References: <amKUdIRBrsFiDTiV@spiral>
	<20260725115956.321185a1.michal.pecio@gmail.com>
	<ame6T_LjiJBeJ2W3@spiral>
	<20260728003131.085171ee.michal.pecio@gmail.com>
	<ampPGn-3C9PSEZQz@spiral>
	<20260730130814.65f7891c.michal.pecio@gmail.com>
	<amuTKengDzr0IL6b@spiral>
	<20260730235953.2d51e0cc.michal.pecio@gmail.com>
	<anOHQ4yEdhYvrXOo@spiral>
	<20260805223604.21acaf9b.michal.pecio@gmail.com>
	<anOiUYwnfuXC0lSY@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Aug 2026 14:11:20 -0700, Bart Nagel wrote:
> OK. Attached are the first ~700 lines of the trace file.
> 
> That whole thing is 17M, and is here for 48 hours from now in case it
> is more illuminating: https://tmpfiles.org/wAwAIQxuuahs/trace.txt

It seems that Missed Service Error pointers are about equally likely to
be 0x10 or 0x20 after the previous event.

And the events are usually Success, Short Packet is less common.

Considering that also roughly half of TDs are 0x20 long, we can choose
to be optimists and assume that (when it chooses not to report zero),
your HC actually reports correct addresses, except for the known narrow
problem case of MSE after Short Packet on an early TRB.

Or we can choose to be pessimists and say that 0x20 can be bogus too,
and then we wrongly skip two TDs instead of one, but three are always
missed at a time (for some reason) so no worry, until something will
change and suddenly only one TD is missed.

Not sure if I have any answer which option is true without another test
patch and compilation cycle. Maybe let's be optimistic if it works and
no errors are logged, only dynamic debug noise.

Regards,
Michal

Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9B624E4C4
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780537650; cv=pass; b=r8bwIFeJeS0VhsSTM9cxG3PAK3A/FontCYq1a14/E5tSum0hpB1lK0tXBiy0PdHRHgv5bG7rQFho4zbOIjEanu+CBVlqbifrx1fLcRso53IfZWqBw5V5Y98/hElBDF9DiUCnThmEWKRnAkt8eDEnqydPRAb7yqvQJgbVaC4UjPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780537650; c=relaxed/simple;
	bh=SNdq+sCcCg8Tcw4DtZw1l3A28CYbMg10gcmtc55dnqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlbwJ1kL4I7A+bYRE3ITwHpOzdAzGt4Bf4zRRGtId3dQ5noWTI2a++EGNihbLW3zRvLWX7aKDoJ+Wub00qkRW1+q2hixOgaYjKhfKcnTwzfIkHey2zPF4ri+MAsf2xnulLNnRllwtmAe8ahugIVhBMonfzcRPfwfiqeuLTctgyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCmG2apO; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCmG2apO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b7866869so1863685e9.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 18:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780537647; cv=none;
        d=google.com; s=arc-20240605;
        b=RNru9tdPFvfI50p9Ms3BmRmPz5Xr3qjupbsSzfgqF3mf3ptGW1Etngmf4i8AaE9yDv
         TYyqPCzuvpeNauMr9TtwWAyVFPI5O2qnKSu5FLBpEd54Nm0UPTUfl0p/wx2untSSYX2F
         UO+UtjW8UTsnDmU4pkHlg7e0MhRz+YgaUjB4/wWqZlWKdoSnRxpyRzPz7ESY57aS+lfe
         SirVLC9VvjzrxLcA3FtA90cADGTXaAnHtkJ0cMSVLL1MJ2st/OzGq3xtap9IvrIuaaUW
         n14EfUTH9ZPDduQpEROMM764fyKqDXKi0iacXUIEtaNfl8VK5xceJUZdTxWBtZd8jqN/
         GrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kNw4e6eCl2JeXjEBf/gjtomn0kblgjjc+2w3iPQk8VA=;
        fh=mHWo8tuFjh0KJaTf/b+oqxMiMzTETJ37FwuutYNXBq4=;
        b=BQ6/Y4bkmr4PPT6t+zjfUB0OsItD7dCrKuHLlZyKHqdAg8otkPt27NdZIsj0zogBMn
         Cd9zdyoVS/b9xgVwWTjgWaImSkTWUp3KiswjIaodUQDn6NpXeWTVfqhOU6xPCkUwxWyG
         djP6Mud0TM4KpPkQAI0GTX7oBnY4ZA+wT2PEFJ6ivruhg1Adz4wJTr793BdjvGFflp5S
         hMGtclKroUsWG45tBn7E/7zYOYNz49Nbug+hwjNqfANYMPj0AxhNoGgijz+JBBs2tYaT
         kWeNgmd0tmOj8nFJhW8JRAsdijSRXjIkn+r+YY5wpu3rCi2kikoEJND+SJz5JX5aCW9k
         2m9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780537647; x=1781142447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kNw4e6eCl2JeXjEBf/gjtomn0kblgjjc+2w3iPQk8VA=;
        b=aCmG2apOtFo08erOHvvwQjVd+2hWMa228i8hyDXgTB37VKerzAR9pcE/27FyQnGdW5
         WnKgfCA5xZMhNcxp+HtSHsumCqndXrPusOpYR1epmWeTaQt7Qfmmmbuxnp4iKDF4d19B
         OM6+jQC8wXAcJnLIYDCBv8ddMPxg8mNzBXUCvHxsVwOfH8u5NNKGDAjXyx3awvpbUepO
         AXql2nxg1w1T3Cj/55vYvhOYs/efA83tNyZjCCu+EOzvtAS1EknmOV1BAugtf9Tqjn8J
         jvktceUlm0x4BmmjGjpRjja1m1cIzgMFGEORE9c4iL3H1F7e60/77xerCVwsbTdu5Yzk
         UiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780537647; x=1781142447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNw4e6eCl2JeXjEBf/gjtomn0kblgjjc+2w3iPQk8VA=;
        b=SSCHl96KFbUl0l367vTB5a6vHQl6JOTkkX2Im55OKiws11gHZ+Qc/HbneVVntz5su1
         W6QEwv8EPFX9p8cN4wxfGdJaLkQjm/45ot7fdjXRuyFB9Bdw6WBAxqZO/lbmYPgzunO5
         5yZrZHAoa9DaUzkeoFRIPbS4gaTSZUaAB39w8VKr6+nqA6Z3i9B4ou4XMgbwhJACZnfO
         qU1Y0xq63vuGEWUfWk2kELxslThLrbYxHtIsZgDYn02PLMjMlFt5tT/GJQypv+A1S2BE
         /jSjMdfs7bwk3A9rh57x6E5kAr7D6k5x+ur5HzQBiNxSGDX9jOMGp+lh+BN4hLNLCFPh
         +yrw==
X-Gm-Message-State: AOJu0Yz41ampSs7/m7CTFpvO4221L2V6dwRpgUAb5zJopyZsQnMNsLWm
	7c69g1X9lxbV7tzh7Qh2/AgYzAFlNg9fqy+8PIKd7EKgvV1TVqvv2C0neZMLyx8T5hhfLEN5DS1
	IJBgi6aMz1lfFhn8V1yGEhfmbDud6s8FmwRfC
X-Gm-Gg: Acq92OF5b1LkWzSQmgpcHP24cJrhcRK9osb6bCgC3c5lShd7ALeToT+YPbQ/0lkviqg
	yAlK+tVENAIYeLYNzz+TlDBVEcF6sRP0yT4srLWKT5VsywMxTrcdAgayvOKSRLlUGoM2XCbC7OG
	lTIkQgDO0GcEDmzUjTrKSYDqIVWY9rEySw/fSYOqAkbjUucbXdQ1rEX6O2xHVI340mVUud/9n2Z
	WFMggBUA03B4H20125AdLIfaEbn3gKO4qDg4XKLzrCaM+wj4CmnaAbEWqZ3JbK+WO5yrJW7BdZ+
	1855sT+EVLvl5gssCi+qBw6IQZ1GwI2BSo2joVSkEWzwh9x9WuIwYDmk2hUhc7Zwo0GXGORfkos
	K7G/E4k6CJhuujj+3ILi0Qg==
X-Received: by 2002:a05:600c:3e05:b0:48f:d5a0:284e with SMTP id
 5b1f17b1804b1-490b6101131mr96745525e9.28.1780537647400; Wed, 03 Jun 2026
 18:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603113626.395612-1-lugathe2@gmail.com>
In-Reply-To: <20260603113626.395612-1-lugathe2@gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Wed, 3 Jun 2026 22:47:14 -0300
X-Gm-Features: AVHnY4JEHdjXfetyJV8m0xPHodIDcZ0BV8ZPDerXQGZRFy8gAfDpZ2ly0SRthqc
Message-ID: <CALvgqEAbR0PPYpsVm=r8o==DcLZMqSV=wYBTGCwo+2TZXOMDsg@mail.gmail.com>
Subject: Re: [PATCH] USB: core: add USB_QUIRK_NO_LPM for VIA Labs USB 2.0 hub
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Some additional information about the affected device.

The hub (2109:2817, bcdDevice 0.30) advertises USB 2.0 Link Power
Management support:

USB 2.0 Extension Device Capability:
  bmAttributes   0x00000006
    BESL Link Power Management (LPM) Supported

The KVM switch topology:

xHCI -> Terminus 1a40:0101 -> VIA Labs 2109:2817

Thanks,
Rodrigo

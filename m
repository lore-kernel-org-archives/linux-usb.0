Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F23E558C
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014030; cv=none; b=qWBQ17WYvHJSuRWY/8uNMevC1hdMUAYQwwRR93kKyc+0A+VfKPWvadHZg0RDPfTeifa1BU7EBq+gCp5Q2HdX+HW82pM6/8A1RAC29UzFsE5uqOuDR6YY21utaZRG4qL7+kDm2oaC09GIrXKROLZwtMxhuWgLkhp0ZlwAkxPIGJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014030; c=relaxed/simple;
	bh=RtRGD0hmoKuCpcgom91M7cTePbPST/NQpWJB4dWXO0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jf07cKgGZjmE9gJFusK15WPYvdb6JRku5jfyKnPMDBsy9cxYx1tJqn+eXPG09/UaKVJiRI8CVUm5nj3+OddFts3aY5jLuJjGiXV5s0O2D9QKVL+++pI6XX2MD1rN8sh0N0TeistWdgZcYJksSs+B4GO2VnQME2poT3YYUQuLPzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxK2WM6u; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxK2WM6u"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1600d040e4so110080466b.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786014027; x=1786618827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RtRGD0hmoKuCpcgom91M7cTePbPST/NQpWJB4dWXO0Y=;
        b=NxK2WM6uwyvB0lGPh8aYz7oIb9HoMdPn9L71elQj2G0lcLFfU71H3hkOInRrw7FEbD
         arEw8hud/tcQ2RFFOk1IQzI0/CbUEx94m08akk0tOJxe9K9IjdlMjzc6ysgh91ejnaiw
         DLN5ze8eo4L0284yUBAok/5fbJb7C9FLL3vWkrlbD2SRCIuOYT3OscGllFriqf7jrW/y
         KNGEptA9NdRFbNgLSAndglJptAtkdwPmAi98VftnfceaiD8aKcMQT0aj7xgu0AMvN3W1
         Wj35pAOw17XPGIX3HvUm5YkV1PQirHhelYxBBQUQC6IzrVY2yTrY6pI64VP9klvZa/iL
         +P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014027; x=1786618827;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtRGD0hmoKuCpcgom91M7cTePbPST/NQpWJB4dWXO0Y=;
        b=FIN/wwWmmxABXDtP62KbGXL+fgbuHwAU2StNkJECvsZ+d8lloetbe5ur9VKtwJdDrY
         XLd80N56cThJ5jyzz/oonbYTGiyI0ON0mx5xTJA+wDxXPoomFllke/kY8eV7irp7gXeZ
         FC0XOodxIHYu42/n5T4qPvmt8kUvybzUip22kAdgiUL+0y7vzQUaHzvoe3Vr/c3+sJUm
         LknwWBjkMPdgnBb9OTfPrOrtb4h5a2m6e3xxA5id3yjF6tNsN/ghcZAhg1aNaPTXsWyw
         7CLFYnvuGN+62t3dbLT3qn0FLqQ90YSkxfvdCJ71HUeWMmlU64GMUKLUO3606BV7P+ZL
         Q2xQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAMC8OORlfnkB+JfZ/mvuzi4nT4kdnWSA002rsJ90MKu8kKoIz+HCuo0UoK0YehwuwlAl7XCk5Q4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeWN4rdSLPXyxO0+uz3fKwBMgbZfAcdn393WCPqBbzXiI2hE0
	nClQu4EEIvnbN/kb9baGZA9txBV/eNVlPIcTiXgGKFPqtZz+kNZDxe6u
X-Gm-Gg: AR+sD12dstVTVoi22dA7142I5EAatCJai9VLPDbx9jgSRdxsbZRkgaLsvuVtKjjctcE
	0xd8T9G3IdfY4MikXO8syFhxn0nuZeEUjpHdwm33Gplu/gQ0nWSX5l+cznIBFbxB3/KDPs2Fkp4
	brbM7SdV/bzfrA1CUyCM8UDElJYXoqq98T6EI6FREVpIZfCtGFIr+KhujI0FU2lwk1bOlYUQpoh
	KDsYSIGf0EUqbRqDgGo/sT6HWOa/GinI7LapX/7aTjHXeD4sZjShK7wgFSRkkYz1493U3wNpKgz
	06EceptpqKEtvnyea3pnlcuzzO7r27V7KSVSHmp5BOOFN8TS4WtkQle4w+N6PvwehMnhXnPWB+q
	l2JNo1QVFZM4BCXIxCZY5RqGGKnzIWEW0klBeBSmYTAsqhfi4IMHl5OZMQbOqNLGJtocOjgUJmu
	7Uvfgjnh+QuVi7t3P+hxDqj4VO3K6YuE6QUwyoqxpZCkAdN7G64yOmrJw6rxPKVkhS2Seqw39V
X-Received: by 2002:a17:906:6a25:b0:c20:53d8:6fac with SMTP id a640c23a62f3a-c20635f3a9fmr175302266b.14.1786014027330;
        Thu, 06 Aug 2026 04:00:27 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20364613b2sm227501466b.61.2026.08.06.04.00.26
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 06 Aug 2026 04:00:27 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:00:22 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Bart Nagel <bart@tremby.net>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] usb: xhci: Rework and improve the TD matching and
 skipping logic
Message-ID: <20260806130022.77401337.michal.pecio@gmail.com>
In-Reply-To: <20260805213028.78a73f18.michal.pecio@gmail.com>
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
	<20260804120537.5c30554e.michal.pecio@gmail.com>
	<d017215b-3e91-4786-9c41-f5685e5c19e0@linux.intel.com>
	<20260805213028.78a73f18.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> On Wed, 5 Aug 2026 20:39:12 +0300, Mathias Nyman wrote:
> If the event points to a valid trb ahead of last trb in td, but
> before the enqueue pointer, then we know hardware has passed this td
> and we can give it back.

Actually, we don't, because of a race condition (and driver bug).

A very long TD completes with Short Packet on the first TRB.
We give back the TD and advance ep_ring->dequeue past it (bug).
Some event is generated later in the TD but we don't know yet.
We queue a lot of TRBs and move enqueue into the completed TD.

We handle the event and it appears to be "before" enqueue. But
the HW not only hasn't passed, it hasn't even begun executing
any TD after the initially completed one.

We give them back and later get their events, or IOMMU faults.

Regards,
Michal

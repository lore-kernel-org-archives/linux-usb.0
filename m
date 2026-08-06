Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AED36CDE9
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037132; cv=none; b=YXo3v6nO3n/bc2Y8URXXP4R904eSoQW5kdH3a3LK/uvQrPRNTCICLPhxEMXDwYzCaDQC2S2uAkFChS+iVscF2FoERgjp8cqZ325fcybwAqiO6aYqMXTWjqiccdUu3NHuyzO8DLvDGatlsvufdE50jpMNyEWgn/rLMLgBt9MuDdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037132; c=relaxed/simple;
	bh=6iehjLz7tK5y+wF7aaPT++cscWa2tz3sEd1stPo+JWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4GeQudx8HuG9tRKu/C75vE7co97ilNrAfk8Q77mg8BV+b3SZu6w41MAsXnOVh+ZQdLNBO0jRtaN930dgU+p5cL9CH6e9q3pakkr9+YOPs/W0FXLqhyocPSjTr1lD4ovW6JudKN9c86wocu65a1XVSqTK3XDCgpjUSG+hCyhZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw9ptqlC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw9ptqlC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2720742a91.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786037130; x=1786641930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TRdZm2/OzOJOHLAefUfdbI0717vY0s82LnHh3Ur5RU=;
        b=Pw9ptqlCc5rOjAO4BXNmTTEMDJnKqw7XP81Rrvodq+jkgjRuPUm5BU4pv69plaar2A
         3QTEsx7bMDqqaaxemFmoPKCrjyCydKb33ve6bjh8Xo1HKhf5vvy+9cfuyXBm07DPWtzi
         lARALAsc49dNY6gcc0whhbFrPcYCE7pAVb5pWedQ6NyjAygrGscK6ZdMSTZ2xd2MUSDV
         ouzdCSqkuSzdDSnTPtQO8HTT/xpEUKXTWvWkVZEZGfyJLZ1grYzUCbIh2zKqzRgdwud2
         o4gAA1cY3paoPQY7bQ/C3C4uPyjtbXXOU6g/k/ihlQDJryq0whq9ZP822IPPZa43qI5R
         BM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786037130; x=1786641930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TRdZm2/OzOJOHLAefUfdbI0717vY0s82LnHh3Ur5RU=;
        b=rU9TIa15SYyBq/YIj8BJRKwusLMOOec8eVf/pEH/Zj5kxr15bTNXyDqF4+c6hgp+KP
         SHb/9WDN8hrS6VKQe6k5hi0iBqZ8nC8YWbNw5lT/4GkBy6XKIKn4UeKo73O82xBQKgST
         kMAMxLwhyOqGUWsh68bYvMRWqeSDLzEH0eqBsNYIZsDYIi2KQ6QfCHqqn+LINtM2w2gj
         xpBXD6ZxMIXPdCUj5VLaQNXGQ4ECZuDq9oAQ+v7Ijk48FB12XFhtIN+qBZYpHDfeqCBa
         RPtDswyNKcSZs91EX/5d5565MLjXKRC0WX/bZoTMnltOsGWUV2ALCvfjGgCFsnBCHlxQ
         lE8w==
X-Forwarded-Encrypted: i=1; AHgh+RpcmNg5+hrbaKoXYWdODJmjY/NbVQ3ux4y6X4DhKaJ+8UJk5nDAZC/AhBkz9Q+9TKw/h/qVLThFbYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMAQffg4Cr8tzNjlgrhY1IagpkSk818vfkfVewITHTdqDeQ+b
	zZZq1XnUtZ9+MmxrMtO66dykJwun67HpV0656JRCkSkqjJUpa2bBsP5v
X-Gm-Gg: AR+sD10T+mwppLeB6HfVNxv/sEPYdqqgbiT8ZA8drS3GxD9CrKmmcekl61WeTn5Oxmh
	XB7kBDqk7FGm9c+HD0z+9PqrcHzmoG4Yi+RuXsTPUva30ROXi8D5oJzEUJDmBNl6iIxRbpbleN+
	owqFUK1IrEIMkM02M93QaxvhEfLC8smMMGyyisqPpQp/oit8Lq1E7cA56xnxTJeSfmY4TYvbJdX
	3l63XMZbM4d/VrphlMCNg4JLk+O0vz1mtldZVOW+VGbILwBsAl+zQJ+6AfHDljtzCbwBhU/guOj
	FF7fkZLqwviGMnD7xW2LNJCmOf0WwgJerBroiPk3kYlUj0NrS5pLy8kJR05/H3H0uCgPi4O08q3
	H4z1Phiy4ITsqKeOaFJUSL1OyLoUKN6OWZ0g5QQj7kH7bi0ch4l2MGvfgJzKgz9i48qRbDyjUcC
	HGsruLdzafo6+yS6Tl0f/cH2euo2KDkc/o9s2ktOx57KFlHwgxOprRYnVExmS25AfI
X-Received: by 2002:a17:90b:1c0a:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-3903b9eab48mr15997786a91.0.1786037130324;
        Thu, 06 Aug 2026 10:25:30 -0700 (PDT)
Received: from Default ([2409:40f4:1024:7ab9:e121:51b9:f38d:da64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d7e4csm31113126eec.31.2026.08.06.10.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 10:25:29 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH] usbip: usbip_host: Fix null pointer dereference in rebind_store
Date: Thu,  6 Aug 2026 22:55:13 +0530
Message-ID: <20260806172513.126406-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026080645-nickname-undated-d0bb@gregkh>
References: <2026080645-nickname-undated-d0bb@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Aug 06, 2026 at 07:42:27 +0200, Greg KH wrote:
>On Thu, Aug 06, 2026 at 11:06:51AM +0530, Jeffin Philip wrote:
>> On Thu, Aug 06 2026, Greg KH wrote:
>> >What prevents bid->udev from becoming NULL right after you checked this?
>> We could use usb_get_dev() and hold a reference to udev when the busid_lock
>> is being held and then release it after do_rebind, or would that be incorrect?
>
>I do not know, try it and see!

I tested usb_get_dev() and usb_put_dev() on the rebind path and it compiled
without errors. No undesired behavior during rebind either.

>> >How was this tested?
>> The method to reproduce it is in the same thread.
>
>How is this just now an issue?  What changed to cause it to suddenly
>start happening, or has this codepath never been tested?

Nothing has changed AFAIK. The driver itself depended on sequential
order of operations and in doing so, failed to secure itself against
non-sequential order of operations.

I will send patch v2 soon addressing these issues.

Thanks,
Jeffin.

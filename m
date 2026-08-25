Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF13A6B82
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 05:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635257; cv=none; b=kKDAU5XuxRydHz0PZj/A0YMYQI82ezce7PO4b9f0RAM+5VhRc/2sgi3zwtoAnglCqj49n7LrIPo5/lsUtaiNI7XS88oRx4q5TvplnAlM5QRZoFB4fFJYZMWH5QmZX4UbDV0vV2U2RU9l7IzaLjqX6tTYrbjSPsqsH4ZDDzBqz9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635257; c=relaxed/simple;
	bh=c/zSn87gCTjzjIcjnVDD3vC4OrOaxiOrWIvV+BS/duw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7C0xnrCePZS+DJoOr2jhGpIbq9yb4Fv/Qf+8ul32LdSZ0GzhHCton1afiTOlKxpUXOsH3lss2zGRGGS8yqAEamStCvEgpR9MLMwVSDJAGUeAyBo0bWRcgTphUzWy8SZ8qzQ77x++hoTLUZ8blWxwDTV5urTU7uMocxuuhK9wKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoEf9y1g; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoEf9y1g"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39266382df6so3622450a91.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 22:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787635255; x=1788240055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c/zSn87gCTjzjIcjnVDD3vC4OrOaxiOrWIvV+BS/duw=;
        b=VoEf9y1gP7SYXJGzmJW+aPGJ/eFT4Nlkhg7RFrY81/uo6KQI83tcin2Rl9/B3Bb3vz
         O9JESsHMOo9afrcc0oXv0q+9OEN8InpnOGCoPhNAI/mathf6a80VXpP0RKRapoGjdXPO
         It0OlRYExxdubEa1B02k9JK85e9gZGDBwQ3V4b/kg74FOjptX59xua/c5AxY0CuJPTqd
         M/JnNzTScf9EBYV0yBqw7F0P3uMykjSXc/CloTO91Uf2Fnf74/MB98y/NjvsW11BoPDd
         ukODbYxZwni4YHN7KHfatvxOZIisNQUNP/X6ytxfLa/0JxCbl9vSDRsT6xVh5ea3R4wi
         KaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787635255; x=1788240055;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/zSn87gCTjzjIcjnVDD3vC4OrOaxiOrWIvV+BS/duw=;
        b=OThQD1moJiM2Lm1MYpI5dFgaN1EIZsWKhUUJgkB6CRhGl8ZzJPe9FswXQstBoy943x
         goIOEcWYVQMVlBHTlZzfk0H8izjxEYAsOUt/nT57A12xNeeaak0ycPPnjDjswenizIiG
         0Ty7AKTNZmHcSRCrh4p8z0R5R44aUOHEdUtb2AInr1DbA1c3SFS0n68s3NvsYVMZJXso
         BlCboWTOg9K/SdizIxD4hx8wuIPopcz7fSs6OQa3MiAG1NV0F7EpslfsjbKLJTZqZBL+
         YpYb4ZxQtMyYhfS+uDTuhuT0wImfjtFPdg0RrnN9sPK1TgM6iAnXW+aLROr6gsLy0GwF
         znjQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5coyRqKZ5wudR2l1kg2MfovIxhugVxsjB2jaq2xRz4TZZcfC+thmm1siT/ojqe5e5mfjRv3KQ7wE=@vger.kernel.org
X-Gm-Message-State: AFuF++lFRydBPNvifcUEwBgKDxpCzN3xr2s6TdjuxwSDNm2YiSMTwLut
	gS96/IhH0NzuBnlsWD0Ry8QvoYBstSz5Vu37o/NIqz23ifBkRslveGjx
X-Gm-Gg: AR+sD10cEf7ub9Tob2OdPABC9xmcB8PhO8TJGc8K6ck/X6+bVYncaNhV6OOxJHjMhd9
	XAryNQeYX1PFRyLRyXF9PwwG/agMKZ50QDyyVGzl8JSbkv9VQwvqYl6/nsMw5plP4q9FVMsVP7P
	z8aXMHtCLv780JtaBOM9BumNhH7V25D7saZ/EYnSJfaqL4DBON9p5r1RFfH9v3RAc27cg7ndDgI
	2A7V9/QQt+JvnN5yYUO4MI8nIpqHoAagMp+KBl6RCW4hFPnmDd472K7etQUfwWwFGUhnV/ereFY
	E15JM8++esjkIyW05VId1/VY1gnp4Gl1hNPVTuDXQtzji5Zw1h0HalJr3C8g8AzuIO5aBumpJL3
	u1t30ifDafhieZMm4EJZJR4zEXz2QExUOIMBuUw44fnMW3IFKRvKUJXic031Ammgr/6guyaovjo
	sl8DPXwHz5GXMzNI2XuqbK0S0JXJlzK87d4UwwSpOSfhvM6zfuqRjM3FWWEok6ZxQ=
X-Received: by 2002:a17:90b:4a81:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-395c33ec558mr54049572a91.7.1787635254932;
        Mon, 24 Aug 2026 22:20:54 -0700 (PDT)
Received: from Default ([2409:40f4:1006:fae2:f5ac:f8df:7687:b6f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm48047175eec.16.2026.08.24.22.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:20:54 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	stable@vger.kernel.org,
	syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in wcove_typec_probe
Date: Tue, 25 Aug 2026 10:50:29 +0530
Message-ID: <20260825052038.23669-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082540-tarantula-gigantic-b786@gregkh>
References: <2026082540-tarantula-gigantic-b786@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Tue, Aug 25, 2026, 10:42 AM, Greg KH wrote:
>Please do not think that this is a valid path for syzbot to be
>fuzzing...

Understood

Thanks,
Jeffin.


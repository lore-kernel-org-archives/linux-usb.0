Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678105;
	b=L13hse5UdDEmlFZbgEIWuLvwwYoXJ2IOVatXvtm//m8xDmXEJfu+JUHgDyXcA3LRmY4r
	 dTwAt1wKAi99x4G5RfRvqPL1fHgJGNdkM3vxmws2X/S2q4/1ioLmT3+e11Nx0bi1w9eiJ
	 TVMHgn04TvALe7299hrP8gpXocieU9aurrhItfD3eReW29MuGgVh1Sv1gj9cURQCbd3kj
	 /9D41UqI9A94Yd8CuYwZZWSmHn37cwiTVEDuYgA5ObtxJQClH88+cprztJKFXoZh+TYLg
	 YQbazGsqUzOFc7PX90ltgwFpcOjQgKpQM8b49D0Cn92hL789mJfd3pdjjatp17oQIZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qkLuknF0pC6/lc6QvJCtrxqMvfVEMMav5NaBK/uycy0=;
	b=AFFb3AKW5aQocP9KaYxGrgPMsE9nyZYzNEl5nzGcCnQcSXSwoQvZGKHC1xlw6mFKMmTh
	 jlKBRSgFtia7uUgoaocqB9Epp4/49ebW8Kwt3iA3u4/zcsHsByTkX9x5aH01se01kO8bR
	 kDYe2hKvlf0XqRyNdWlckY3dhGK142YSvJmt4I56q+KqB3j3h/hyU/AvL2SV/wvKIUBjN
	 rFyt/hh9XuK/3YpS5vcwmaaW2+ayau4LWLt9or0mMVcIhPTcjwqHph2xx13z3EsFmhGRP
	 snRq8KxLYH3BXYQAJulpf7/1ZLXLBldieDT7rttTvg+u0+UzdVTwjA2yZRb6A048GtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBhgDzwG;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A771606A31F
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 14:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A771606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CBhgDzwG
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so5495365ad.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678104; x=1793282904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qkLuknF0pC6/lc6QvJCtrxqMvfVEMMav5NaBK/uycy0=;
        b=CBhgDzwGV6n2mpmUEXRAB00Rm402wdjW7AhIOiGL0ywKZAmV9M8WheIFRYt3EGJqVt
         7tn6kKFYsTbJotCkeZSaijojS5nR/rZbDj11cIMz8mgM+srbP4NL/HABwGZjJqNuv0vB
         DZtrSu9xmMG3wPNHKGOKRFzTM/j3zIIrUr/r5WIW8rqL9mLo0POfl0kvp/Ho2K3MRBNK
         sBjbFV2Jp7kGC+LLNIsV6XxS/5UJl4xDjjs5NqAjU+v4GM5NUYN987dlqed/UARegukC
         PpGzLG1yzW0AJFC3k+sS57mlPCQ6KVm5QVo8CN52J3AWb9y27fro14osOX6mW2tTQA35
         f+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678104; x=1793282904;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkLuknF0pC6/lc6QvJCtrxqMvfVEMMav5NaBK/uycy0=;
        b=L1lAcFgM2z0L8MtqVAZSnrt3F87LRTj08EBbHLytNkjPTEcdG1U4HDn1Eysigq1pt0
         KXJfNC/5hckkriW3ERfSYvuNl3EJMnnRei2HacDiNKKRvdUqZ3p9pbnHW0aSwCsVcogX
         IyNqcvflVbjGy0gRCOn1DlPMKqL0tRX1jW0oUWlbnMwxgrCHHusD31Zc8h+qI25Z0cWc
         5Lj/dKtTd1zay226FDnqkcNpg/58Fher6VS+YQH3D6fKJyyhAa64TFfLUaS24KeK/ta0
         Nxm0oPsvhC49eeiXn7+9eN4IFHaFnm9alT0WMmoZNCQKlt6Cqrt7NU90WClEdCYp73Fl
         XkzA==
X-Forwarded-Encrypted: i=1; AKwUvByLifDb3VKHTDh20FmAURc1RjkRFlzYiR4nmbQTk4GDQ2WF5+LLSwvz9zEq2yBfMnz+HXqmCv++Qmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEBQJzxSbE2m36R9OJUVwQq1VEMHiTZla+T0WNJiT8vxmE56Rc
	vZJlejbxIb697+2nfAIQRjnvp5efIF5Y/N5SAiU0BmOnetLrohn5EZdj
X-Gm-Gg: AYBFou1N0iSUqs0FOgh1jzpP4PEDBqlb4iRPp9CMiFiNIjEX4egaPG0fyLoBehg0G5Z
	xnKQzi1vsZk4bNJrGtTilE0kUu7EKX8Z1OeYkUsj2NOLvySpr4dzEYB0Pkik/giBWr9utpNBCRi
	U5BypDl8komeO4hUPjbe1lQ+Ex/s2dio0iTVawwuFPrM8S1AI1p6Rx2fV89TwRii0cWzJhazexI
	UoJmK8Ltax0+5ZKtapCJ0lpbPgKGB9tWYo0WnFfPvcBliLh1VeuWj+HLOEDHQnkXDDYCVJ7q0Se
	VvhmBkbYewhS/OS/GqsMGM02vNAcOVpnrbQAWlh2mVIWSwufZul2HdsDcFA3v4gxWFmVIgDPSxZ
	r8NMAuI4JYkE4nKaTDlXFd9m3jMsk9hWjhpZHhjuJJzZ23eTF1L01LBP+gx8pDLoxLu0X3D27+m
	+CByAYeWnxqqQRweamQlEmhuc+Euf54lMTY7RLve0/UZqLQlCHnWldUIoI0TNA47gxeFsjyNEhy
	ailkmgE5Fr6WzhiiHntqpgIG4L9fnVR7OeUqVvDuw3RncTp7toOx7GSQAjvNseYWGxJfxPVFKg5
X-Received: by 2002:a17:902:f686:b0:2e9:7190:32e1 with SMTP id d9443c01a7336-2ea4397e093mr44704725ad.17.1792678104373;
        Thu, 22 Oct 2026 07:08:24 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.225.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm24795945ad.39.2026.10.22.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:08:23 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: sashiko-bot@kernel.org
Cc: Boyan Liu <yymhvert@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+02480a85e1a0d4f5@bugs.sh
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()
Date: Thu, 22 Oct 2026 22:08:07 +0800
Message-ID: <20261022140808.18287-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-172189@kernel.org>
References: 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Both findings are real bugs, but both predate this patch; the
use-after-free fix itself is unaffected.

[High] ncm->netdev NULL dereference in the err: path: agreed, the
window exists -- ncm_disable() clears ncm->netdev locklessly, and
ncm_tx_timeout() already treats it as possibly NULL (READ_ONCE +
check). It additionally needs an alloc_skb() failure inside that
window, so the race is narrow. Pre-existing; a fix (guard the stats
update in the err: path, or move the clear after
gether_disconnect()) can be sent separately and does not block this
patch.

[Medium] skb2 leak in the err: path: agreed, also pre-existing.
Since this patch already rewrites that block, I can fold

	if (skb2)
		dev_kfree_skb_any(skb2);

into a v2, or it can go as a separate follow-up -- whichever Greg
prefers.

Thanks,
Boyan

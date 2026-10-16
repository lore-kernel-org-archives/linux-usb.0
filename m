Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29789346A0C
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132242; cv=none; b=me0ozPud2AWSibodHG5YsTFQ67YWGHCiaCtf/2GYkYDfRBZ98SEAgsGbWqHmjL51HnRfk52JTFAL7vPdJ+LZTI6tfjaHBoOCfD+trRbj3WdiS2Wrr6EZ28l6STPlKwXsPZHdcX027kP9LjU7vuNR3OAW8rGYtvrzHBM4hmISwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132242; c=relaxed/simple;
	bh=EnJXryAzd2MmLOV6utF8NjA0rtglgVl8kpf22A0b4DQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p52JewldxNtPnv6N+ZSs/F67jKnb/EM8kJod7y4PeIgGixmhIDLHYjkWNumciClaugPFhuEfMc8ofk+aoe0pf9NL7xGfMFMos65xwaJLRLoZC0Q49qHMX6gGrWXTUF6NuCTPw8MwUVEpLdMHJxg4iOUSyh5yXZYhZveUV3MUYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acd4850f40so124391a91.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 23:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132239; x=1792737039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v1EPLsvCVMotiYy7qmQH0h02ppuaDgwmZfPCINkzqrc=;
        b=fQITJxBcpBDkZ3wTAJ4SCnzKPYYWof1MibkuUAk+b6BL1WaiixbDKaFYmCxOvpnF3u
         PBKdU8mwwQ2TC1BIKIkJrf4kIQN+3DbQD7TwG0WY08gaQbGvI9gvelFe2z0AERjxplzs
         hkvGAjy0Gk+WyjYiJ8dpcOFM7BPnitSU3/bd/rAqwwes40LN52bhvRRI9GbilEVan5/s
         KCUNvHU02IAnzhPo/vvulnLdnFyu2/7KRUK0coiSnq18C2ylNd+jFSzwP/wBWSXhneD7
         qP+0lYhWr0Ic1mmR68WqUP0cux6pj+cKtIXxUNjp+Hstlp8r+hK3DpDu7DSC2SDaWo4p
         wbFA==
X-Forwarded-Encrypted: i=1; AKwUvBxop5o2RK3TDrwRcw7XE9jBkl+vFnZaRVJY8B5RpAtWRV1G4cpQlBOn8zOkX6NoCsQY0Y39A1u+Fzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5aNGfed9tHzsybqIoHjR3jy96xB/YpyJiNP5azw+Q74YsDiMb
	2rSR5lLsxps2fpYuYB5+fcy/TjUBsu3Gd+TPYrNeVo6Ty5yyADxgYOM1
X-Gm-Gg: AYBFou37nxSGdjanUNCUnCbaAoThM9sKdQuxnb8PcQsQFAU63vpcj/keBocimkKEYdZ
	3DcJywDykQFN+pSOR1G/mU2zUQJNA9GYZvEDR+lAzs/ETL4gRUwJFV6r3YhXnxZ+l/RUCWXa/my
	oXlP7WIk1N4xonD8e8jto0vKkAJTdFIoDYBO8jQecJ9AhRh4a3nxQORUEWT7g+shxB1ohplxYtK
	zkiynyb68NUGxDJXnNBZUmUozdlmCkg5Vk1RsDrmnAqP1gcdazGAbfHznsDXAR3KgYalm49mSJL
	BLT2shfJwSs46hU2hQ4WU+EVrR2r6zeg2I8eTbn+YY3XIjTk6bZlF+kpU84MCJuKnBTgdgbJyx7
	AvcYY+SBXsNt+/0AAKGdQTLNYPvfhc6r9+96Fe32GF1i+Grbcf1S60w4r4MmPj3cMjjpL7+tqdQ
	8WQlnRg59aRdaHxZlrFmMH17EYQdVby99DzSyE0TD23qkuCZ2SSBSTF4mlfEUXVQbOVXTAGcSIS
	Kf/nI7JkdxOlA4Sbf7nB9+XwyIK33orag==
X-Received: by 2002:a17:90b:1d4f:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3ab3a955988mr18078106a91.31.1792132239080;
        Thu, 15 Oct 2026 23:30:39 -0700 (PDT)
Received: from localhost.localdomain ([216.247.110.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm7808925a91.10.2026.10.15.23.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:30:38 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Oliver Neukum <oneukum@suse.com>
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] usb: storage: bound timeout=0 URB waits to 30s
Date: Fri, 16 Oct 2026 14:30:34 +0800
Message-Id: <20261016063034.78369-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <aed1c8c9-1603-4d35-9b2d-e164d559f497@suse.com>
References: <aed1c8c9-1603-4d35-9b2d-e164d559f497@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Oliver,

On Thu, 15 Oct 2026, Oliver Neukum wrote:
> And these concerns are entirely justified. I am sorry, but there is no
> uniform timeout suitable for SCSI commands. If anything hangs based on
> wrong timeouts, that is the bug to fix.

You are right, and I will not defend the flat 30s against that
objection. There is no single timeout that is correct for all SCSI
commands -- which is the same conclusion Alan's comment points at, and
the review bot's. So instead of arguing for a number, let me report
two facts that change how the motivation should be framed, and
describe the form a v2 would take.

First: upstream has already dealt with the specific device class
behind our incident, by removing it from usb-storage entirely. Commit
a3dc32c635ba ("USB: storage: Ignore driver CD mode for Realtek
multi-mode Wi-Fi dongles", v6.17) unconditionally ignores 0bda:1a2b
and 0bda:a192 (US_FL_IGNORE_DEVICE), because the driver-bound CD state
prevents usb_modeswitch from switching those adapters to Wi-Fi mode.
We confirmed on 6.17+ kernels that these devices now log "device
ignored" and never create sr0; our deadlock was on a 5.4-based kernel,
which predates that commit. The patch should therefore not be read as
being about that one adapter anymore.

Second: to your "that is the bug to fix" -- we kept digging, and the
digger found two distinct shapes, only one of which this patch ever
addressed:

  - One September-shaped incident family (sysrq-t stacks): the command
    reached the transport, its own 30s deadline fired, the EH engaged
    and then parked in the unbounded notify wait, while the control
    thread sat in msg_common(timeout=0) with no bound at all. Here
    everything downstream of the fired deadline was unbounded -- this
    is the residual gap a v2 could bound.

  - One October sample (kdump, dissected): a pure block-layer island
    -- the TUR never reached the LLDD, was never started, so no SCSI
    timeout was ever armed and the EH never engaged at all. That one
    is a 5.4 blk-mq dispatch bug; mainline has since reworked that
    dispatch tail (e.g. 6d5e8d21e899 "blk-mq: remove unneeded
    needs_restart check" and the surrounding rework). No usb-storage
    timeout change can touch it, and I am not claiming otherwise.

Given "no uniform timeout is suitable", the v2 I would propose
imposes no uniform timeout. While a SCSI command owns the transport,
the URB waits would be bounded by that command's own SCSI deadline:

    timeout ? : (READ_ONCE(us->srb) ?
                 scsi_cmd_to_rq(us->srb)->timeout : USB_STOR_URB_TIMEOUT)

No command would be limited below -- or beyond -- what the SCSI layer
already grants it. A flat fallback would remain only for the
command-less internal transfers (the probe-time CBW/CSW/CBI exchanges
and similar), which today have no deadline of any kind. To your "if
anything hangs based on wrong timeouts, that is the bug to fix":
agreed, and that is not what this addresses -- in the September
incidents the command's own 30s deadline had already fired; the
problem was that everything downstream of it was unbounded.

A question for you as the maintainer, since the answer decides whether
v2 is worth your review time at all: does the per-command-deadline
form above look like something usb-storage wants, or would you prefer
this thread to close as a findings report (with the patch withdrawn)?
Both shapes' motivations upstream already have answers (the ignore
entry; the dispatch rework), so the remaining value is the generic
timeout=0 gap -- and that is yours to weigh.

(If the direction works for you and Alan, v2 will follow Greg's three
formal points as well.)

Thanks,
Hongyu Xie

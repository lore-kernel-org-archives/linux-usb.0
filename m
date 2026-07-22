Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF853B42D6
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734827; cv=none; b=Zh1Mt0pJmzJ0tTSoYpytKyKF08u6U9bhx9X0OdnP/zTYKejHaU9F+nV1omr/ugB2HLuHDm9VvjCLuL/Ix0CDfT6t0M4yn8AELOiyv+gMGKWO7xCpdabejtEoOc0IgWX0ucI9bZwsGBy005gGMpaG4ifylpiy5F8NdaexV7QumFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734827; c=relaxed/simple;
	bh=0nlEI9jCxE3tPdHDHFDttbJJz7G3g/iq5q7F38xQqlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2vZnDe600mu4DOhDiNfyO1yi3mai7RrFcU6L88JvEpLgkuHXc+6qGY68BhpA7GmqXRL5o5tGO4yopGJ0G5EDjxKKBl7z4nMZhJEwOvjZ21HHmJmRkbURXYquYo02uiQKtMr6DMbCmKyrJW8NCnBpHwQT4lLmOERbwzWff0KsF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FF1CdfQj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FF1CdfQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DCC1F00A3F
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734824;
	bh=0t8gQaKMc/ZXtwD0jqZwEWQOmpW4BE7yHhxrhnIKkTo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FF1CdfQjA5YU6UPgoNn2495U1jmnSduVCBGYSb6Ho/SpcbQyueLz/Se2lynEClEYo
	 bdvNqfBVXjrCFZWL0SG0kgJBEDwzKv27928MyIM/fJnGdEI0Ig7mDuGGy9NJy9thUF
	 8iNtQyK67P/hSVJUs9xmNPf7k+5G2xNhOzcmVrFPW+LSC2wXlU1/wnxyZSn378Hdtl
	 GrnWhbzLPMZNuJZATCeghmsF35HHS9PCuBmEziTmtGvHMGulxAn1VZj1DHVxadNVLf
	 pnlmv6jQqZBhUgatl4El2aRJYMF5/jHi8fNW/n3eZwYEXOQofQ5gA7OYLcUYisK/ke
	 8/6am7uiDvjlQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b021916bd3so11764707e87.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 08:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQnz4sX+gg2y0OJo1yfbKEtRyPPUBNQdZAQbOEpynrDIavTAG5djlu14GeVGbhV4wsgKol6BgBZmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRIH8B6VAYwxRG0po6N+XMGVUkLpzQ0xULPzixXdn9R3iU3Ukl
	uyPCJ4YifWoXXhEdRitiLcax1BF9bAVI1yPEwqTiv0UbLdFvRcFn3jtTJueJBdVsiq/B4c2wyKC
	Y3wpUsBXWiszJNDngft+boGZQFsK8G+o=
X-Received: by 2002:a05:6512:250f:b0:5b0:2190:1470 with SMTP id
 2adb3069b0e04-5b28f85e4f8mr5219479e87.3.1784734822551; Wed, 22 Jul 2026
 08:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602032413.1540166-1-tuhaowen@uniontech.com>
 <20260618013133.1047270-1-tuhaowen@uniontech.com> <20260618013133.1047270-3-tuhaowen@uniontech.com>
In-Reply-To: <20260618013133.1047270-3-tuhaowen@uniontech.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 22 Jul 2026 17:40:10 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j-jctEzVMoWDWewpuRHZu8Zm0MgKyk+zQdHTD1KwNibw@mail.gmail.com>
X-Gm-Features: AUfX_mwRFKqssn_70u6zmdA90awB93un37CmLfl3CLL4YuefWZy1nGA5QUgUhUY
Message-ID: <CAJZ5v0j-jctEzVMoWDWewpuRHZu8Zm0MgKyk+zQdHTD1KwNibw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] PM: hibernate: add pm_hibernation_snapshot_done() helper
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: rafael@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	kernel@uniontech.com, laurent.pinchart@ideasonboard.com, lenb@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	oneukum@suse.com, pavel@kernel.org, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 3:32=E2=80=AFAM Haowen Tu <tuhaowen@uniontech.com> =
wrote:
>
> Some subsystem resume callbacks do not receive the PM event and
> therefore cannot distinguish the PMSG_THAW phase after snapshot creation
> from the PMSG_RESTORE phase.
>
> Export pm_hibernation_snapshot_done() so a driver can query whether the
> hibernation snapshot has been created and is still available.  The
> helper only exposes the PM state; callers remain responsible for
> ensuring that any device-specific behavior is safe, including subsequent
> poweroff or shutdown handling.
>
> The helper returns !!in_suspend.  This variable is set before
> swsusp_arch_suspend(), cleared before the snapshot memory is released,
> and marked __nosavedata, so it remains clear on the restore path.
>
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
> ---
> Changes in v3:
> - Split the in_suspend cleanup into a preceding patch.
> - Clarify that callers must account for poweroff/shutdown handling.
> - Drop extern from the new prototype.

Fine with me now, so

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

and please feel free to route it along with the media patch.

> Changes in v2:
> - Rename pm_hibernation_storing_image() to
>   pm_hibernation_snapshot_done().
>
>  include/linux/suspend.h  |  2 ++
>  kernel/power/hibernate.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index b02876f1ae38..2cebbec3e2f7 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -393,6 +393,7 @@ extern void hibernation_set_ops(const struct platform=
_hibernation_ops *ops);
>  extern int hibernate(void);
>  extern bool system_entering_hibernation(void);
>  extern bool hibernation_available(void);
> +bool pm_hibernation_snapshot_done(void);
>  asmlinkage int swsusp_save(void);
>  extern struct pbe *restore_pblist;
>  int pfn_is_nosave(unsigned long pfn);
> @@ -412,6 +413,7 @@ static inline void hibernation_set_ops(const struct p=
latform_hibernation_ops *op
>  static inline int hibernate(void) { return -ENOSYS; }
>  static inline bool system_entering_hibernation(void) { return false; }
>  static inline bool hibernation_available(void) { return false; }
> +static inline bool pm_hibernation_snapshot_done(void) { return false; }
>
>  static inline int hibernate_quiet_exec(int (*func)(void *data), void *da=
ta) {
>         return -ENOTSUPP;
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index 6d3e637c5a02..045d29f55011 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -113,6 +113,18 @@ bool hibernation_available(void)
>                 !secretmem_active() && !cxl_mem_active();
>  }
>
> +/**
> + * pm_hibernation_snapshot_done - check if a hibernation snapshot is ava=
ilable
> + *
> + * Return: %true if a hibernation snapshot has been taken and has not be=
en
> + *         released yet.
> + */
> +bool pm_hibernation_snapshot_done(void)
> +{
> +       return !!in_suspend;
> +}
> +EXPORT_SYMBOL_GPL(pm_hibernation_snapshot_done);
> +
>  /**
>   * hibernation_set_ops - Set the global hibernate operations.
>   * @ops: Hibernation operations to use in subsequent hibernation transit=
ions.
> --
> 2.20.1
>

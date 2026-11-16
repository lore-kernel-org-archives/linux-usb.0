Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850651;
	b=VaifesGKvBDH7eEfm6otBL1U8+OEuOZ9QjVAR1ggtlpUcWxqJ90BLsV9EmxvJGTFSAsK
	 ypUCvHByfU5N7/EyTc82WW6MlJ8br8K3e8g2jiAqQ1VAdKhLdTL3G04d5H/MiRXkaM/YN
	 Ievx/SocVh5OkdiNWHHHRqYU7mPBwvzopsdiCaeKDzzXxqDGyuYmTqVGOmn00RI9frTRK
	 yF14hIvMCYVqz1fan5WAleVW8a8Byky/nSRxuoJG/8QGpDVGuA2kcPT2XGjCYAPtEKocj
	 laD6Rssqg8kKOd81lcKfBsOmRszBudSzy02LjQaaV72ZCw5Be6bUGffwLI52nhLbJjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
	b=bioN1dFoFjCyjoe0Ik0y31EXJoVRQcGT7wwrXg+5DPsMECWWKu0q97+pghJvoWEX3QYv
	 hH7GhRSXicamKDwwQGXCzHL+jIDKvEmMmICFhSA910vAX+YSmxzE1eoeG9X1gjtlw+iVu
	 aGiuTidz5zRPa30zEBbfkgaSSWDckehvf9Slacvv+CndG34qlfSxdggHYjmrtFUS8RmY+
	 8TXIb9Y2f+dZkRWPMbL1yhImQgenlqP46Jd5u1tH58xF79kfG3CBzOc16Y6/JU26d00EO
	 PN9q0GJoIPOYCTfeVBUYKL8PidY9rvfTt51gMCFGIxCWVMkMyYepuFBd7IUs+s3BSzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474A6606A88A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 17:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474A6606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wda5m4T+
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so218680a12.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 09:37:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794850648; cv=none;
        d=google.com; s=arc-20260327;
        b=o7KOu8/n1CTCSGWVfbHZ/Ts+kPVSuht171n2SIDzROsDWwi+qhUvitURXeMyN2WjDZ
         BbSFU28vAmv9gM/POCy0mvgRoML+CKUk7OcI+L2Xl4UjDLYOsQ5wKIIFRvJ8oQs+OHQb
         Q7X+CeG2HLuLDnKlNhbbcYAqImo2+0uq15+BQ3TNbREZPwxt8OAKuNh8JVMf3ScK1S1C
         NijI/5cbfp/SuFUXUAP0Ed3/Ciillf9POk/dolKEturczgZWkFMySzAxsi23UFIObBfd
         lBFpJ1i1ZblaNTxr1hl1w6yyAnYS0ZrTJMOTaZxDDgMt9oNXM97SsFIAe+o5OYKNWMCf
         yLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        fh=6K33MYtZPulF6urciLJbhDo+LC8c27Aqo8jNU6EQM1I=;
        b=LQXaztKbp1zO0yv/dthgt5cOd3dI1Be/bUeVhkMR1L/ZonhaZFkldCIJTNY4YhXTew
         Of72Df36hFKtDrjvsoWN6YLBV9Ii8AKllWoX5m8ikxriLGUDnlWC6EFxbNxBguOYV7W/
         hcWkbDnuVG6LXmIaDkBAkIYTkxz5KAEeCQqb8BszQG/mxfY0EFoYNK5IjzInjCeRCUN8
         NnQAPZw+6DJEOiF4A8U4NnAzsJhQ9EqTSorJQHeMFdsEvdh2/4J9tLA8QqlChx315oLc
         UZUG/MvwDOgHmsTy3AM6MYfzJnlsWf8l9BBwoKWhx5fvRBIp5qAfSZ4M1CsrLpUDBefY
         OD1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850648; x=1795455448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=Wda5m4T+Og74YNLartpajMnAcctT7hnb5haqi9hjLlBRa67TYcEPjf80gw45qsgIx7
         FMobW/aC2ZXQsUmoaLilVLeaESS9ODytholTX6ZkGdI39Z50BqAMQuVm0upEGdU/eTIl
         KzXBiwaEJY7eqa6p49n+ZePGE0YUDeVtz78JPQJb7w7ae3zRsyAfYOAEtJq8eS6befDe
         ANfoXo4rOnrr9cTK5CEQbvEa19yD1CMimOfBL7pxwr0U+pGpN6RB970vgsC2xV+kB6BG
         DqloDFELm5xz1LM2zdKvbUwHIwogDmvmrNVDo81Was00uh+K9TR8cjrFQWZvFUjBWrt9
         3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850648; x=1795455448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=BVoEtEO8V2vtzTVBcXIhTVRu5MVwRcFVMRks/XHy2zjlnjaurAWjrCIOs25fq3OWfY
         cYa6mg2XIEiuZZ8LNcd5uSIsvRH3Q6exnVYDOZ9dEomrWxkhPsCZafRsqkV6Ut2y1R9A
         +3BkhabU83dVGhhvo91ZgWNq3dDnb+l45S0/MgT7e75JAacKHYyCUWh+PzIo4kOdVijK
         4jG+4h3uSzrf+Tf+YVNl5QcvamAXO96sgLnmy9gs9H5rcoOBNvvRqEJ/4cDCwv+NmEH5
         iAFFqWDqUi3Qn9nw4FZXVdFIJ5Ii5yd9+aXIMWGh9RgUgE0rQC0tN/IsIm7dDJltBtR4
         pQGA==
X-Forwarded-Encrypted: i=1; AL+hErH90+ysIHcEAIeFJdO66+Ny82ukzJgn7unHVzP5Kk2gILJ/FH3QyDE97IBulCadQ2PGiceytVVOOdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z2SI7wXvklVG3VbaYjyu+tdLtnVN0xgoBRiySVLM8SzhRVsdt
	MUP9palofwx5VTcMlfB7J3Y1jjArIeB1KiGzCL0L9I9FXcwFSrwX1uW5XH6Op/s7FHiK+4kB7kN
	060gGEGFh3kY4YPZm18Nc/jc1W4weA8A=
X-Gm-Gg: AYBFou1nj/HoGEosarHGXQJdhkxSPh0tkb5K54IOXdy7FW6RT6E1JZ9eYKuws+yrtMK
	IxXxwmBpdUkZRWs1aGNIAEVAkC/ERcsU1l4RvsCBijmrfApUyNe98gakX9hr45LREOuVTFjMhCF
	JQSNJghi6AW5i5yYN5ktC6xlj+RU0eR2KE0nQI0UbE90WSiVSRsQU6wh00NKKVb+V7uiEm8t1/X
	a2AcoOgZq59zDEf36+1Ie7W4+8SMFU+OS+v/RDwXDOzjE8HGRZn1G1Tr6fLxv42aFrZ2BTk4Zh4
	dpMpNuNo+McpKi9b2WfYms19aMfxx1kn567uMLpj4s6d2xpN1zhHCmj2EOHIK0ectioZImNoZ0u
	ZspGggoyDJSstwDoNaHlyLn4qQYRG9tsDKlSLadRoYld3kbBDfEaluzN39RtrYSf2M54Jig==
X-Received: by 2002:a05:6402:1598:b0:6b5:7250:d621 with SMTP id
 4fb4d7f45d1cf-6b859ae1a00mr134291a12.15.1794850647426; Mon, 16 Nov 2026
 09:37:27 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:37:16 +0100
X-Gm-Features: AclHuK_sKnxFPAK3k65pZhjyZC94SJD4eZ9z2j_P12s3kyb9TMw6hurQcjyq55Q
Message-ID: <CAOQ4uxgPerkkG4ie0SyHVXaBD9VZN2wYfQpEAEi4hytn=ara3A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> The data of a metacopy file can live in a data-only layer. overlayfs
> doesn't look that data up when it looks up the file. It only remembers
> the absolute redirect and looks up the data lazily the first time
> someone needs it. So until then nothing can tell which filesystem holds
> the data of such a file.
>
> But a data-only layer has no business being a pseudo filesystem in the
> first place. All it does is hold the data of metacopy files and the
> regular files of a pseudo filesystem are kernel interfaces, not storage.
> So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
> mount time.
>
> Data-only layers can be added via the "::" separator in "lowerdir=3D" and
> via "datadir+" by path or by file descriptor. All of them end up at the
> end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
> of them.
>
> Note that regular lower layers on pseudo filesystems are left alone.
> Stacking overlayfs on top of sysfs keeps working.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/overlayfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 39d4d57dec230..719c2569dfeaf 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct=
 super_block *sb,
>         for (i =3D 0; i < ctx->nr; i++) {
>                 l =3D &ctx->lower[i];
>
> +               /* Pseudo filesystems don't hold data for metacopy files.=
 */
> +               if (i >=3D ctx->nr - ctx->nr_data &&
> +                   (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
> +                       pr_err("filesystem on %s not supported as data-on=
ly layer\n",
> +                              l->name);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +

How about we make this just a tad more restrictive:

                /* Pseudo filesystems don't belong in composefs setup */
                if (ctx->nr_data &&
                    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
                        pr_err("filesystem on %s not supported along
with data-only layers\n",
                               l->name);
                        return ERR_PTR(-EINVAL);
                }

I could send this as followup patch, but since this version is simpler
there is no real reason to have the intermediate "only ban datadir" step.

Only the commit message needs a little more flexing to justify this.

Thanks,
Amir.

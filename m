Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453F37FF60
	for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 13:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789218784; cv=pass; b=epXRSLjKTwpaHcw3gRic45L8XVc/G8BI0HxBxwkYR7Mwy4mMk91lQ7eQyw5s7OKCfBMwAWQAVfyOkTOoA7qHUO1xY8nETu1n99UI64rHSpvDi1GyFPxEKDsH09n/EGzLk8KjSi2wd7559d2u4PDIYk1Gys+w1wFdZ8N0snASc3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789218784; c=relaxed/simple;
	bh=/rWnSn94XW4dak/92NRYKqU4/QRRc2HocPcC6LvcBw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfXC/vu2VnjUpGRGW09dRz8/vibu/6V8vlUbTyJQHtfnm7kpJw22J5KsCf1JzYKO/NR2kjvYYYFXNBAsDLAkaige7FTNZGNhSo55EBffwLQ25QeHg7rV1kg4/YGPzZOxYBwHcpC+tvQfH6C/RgAzGPEJqp70F3LQy9SF/CdFgbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=na68zHDp; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="na68zHDp"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so310396a12.3
        for <linux-usb@vger.kernel.org>; Sat, 12 Sep 2026 06:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789218783; cv=none;
        d=google.com; s=arc-20260327;
        b=ECO7rSU2/sfyfzLZwv7zAApfL+HO9FljO+VzgflhJGI0Hnn56b3hmY89PWLfcRqBoe
         ee1P/3k55Yl1ZF/OPcmVBywEOjvAxyFKgio3ziD5raz3vH6jytUinNdZUOlf0hlxBNcC
         L5SfK8gQ8IqJSxNtr52wLNoSWSFYrWOUZObI4Yrxtu+dPqXGyctBdChHJpVn3UbMySof
         SPQwGj4IVRDwdNh6AowOdw/+xtsfh8wcoLNRtW8BgEoAdIlwYRPpo22hDFTAWsVOiB/w
         jlkkTwR3+iuROchs1yCzZPJWWYQ7Z4co5wUTdKYgxns7qm+mf57tdGAiicjVZHkc7wzG
         1OgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YglntG+3HVQsRHEzrZgo724dnawTqgCfzPU67VyDtNM=;
        fh=JKrmxPQ339LK7MI0dMQTWtYYD04N6T/7uw1sJjx/yY8=;
        b=G4yYsGW2385F6hn1VIhl+1zYgqhje+vUZsHUwCKbOX6/kS3eHQXhl1lqf4Mb8APpVp
         mlXqovjBGXpqRIxyin8hkh4KCddHdnmyFB5gJ3Nb/7yRBNFk/467l6nmJ46kP2u8BKrK
         3s7gXkquBGt7isYZ5OlUiQOYweVjNjEsZMiSZRKvRdW9j38yrYS5aridUfdk5YnoqDVF
         7x5BI/yqXlF/NKkWxTYkkz8B3uX2IWztqsfxkpgLPv71mTzJVhfqoiUP1WHuj01670Pt
         /90W6wPvdW98M0dggI3iRVW0QTWNb3ofuBdJ4DtDNaAMUiA1VIIsa6ZHa0EOS3xHUH/H
         3bFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789218783; x=1789823583; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YglntG+3HVQsRHEzrZgo724dnawTqgCfzPU67VyDtNM=;
        b=na68zHDpybM23TltoXE3NsuOqQtXZJ/Tk3QCS4HS7XViuGhKqCUHxsE+9Mci+2b70P
         UaUdL9wvnhCGyC9CeWOiYPfiJcW9I3CBSbWk8pwI3mZP40JfvgK8Xcsj3OvphZZ2uoaX
         mKuUeFyOhXbRs8pQsD7NZvoQCBMKFYz5C/GI2WOa3cmNcXAN8+wDOHSYu7dZNRAZVP+Y
         aJTByy1DaUQF9yh/Fk0FbUzjuXKSXFcGWRImdlloRMDhD1MwWCHg/nVuiz7ery4+TSz/
         tFaPYpWOrI/GZK/+f6GV0kru5jfLl4u8UG+o1R5UC5yCz9/6s02z+zcN5wajZbqJ92mx
         QJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789218783; x=1789823583;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YglntG+3HVQsRHEzrZgo724dnawTqgCfzPU67VyDtNM=;
        b=QPeOhNrvFMEoHqz3fSoTSuzgeVMLKplgY/PNmUv8jRAaC2C6cOoB6kF19En3IY3Od8
         TNafBVQHfjGd8PwsLx1PvsPNwiTD2g/uepzjGu1xwAlzfES2rTpyxQ2RAZ8D0gmXlnKA
         nHEpUAkAl3O+hnf/S+rTb4QcywWxEqLqJPw6H61W8reNwvlwo4AioK5vBPOrfJih0515
         GlmxqjhI3Cg8LzMXArIuQaEwPR4yDHz7UdK1CEWtAx43H5A8leT1+Ah2ELEcodXOEr2F
         SNxXxoepwzKkeU4CypL5fqRXva+dKWKPZGvslTaEVSUJE9beh5m+fJKmfBCv/uiQ3qp0
         lkbw==
X-Forwarded-Encrypted: i=1; AKwUvBygaUuufUyitPviTA7rHOaJeVeXlhgeXZZosuuY/lH7ra8qGxFBRMbo4+m9SLHR9/o53wWvNLwA2K8=@vger.kernel.org
X-Gm-Message-State: AFuF++lmRX+4MSFK4keutWv1NoGFvAlusdAIFAKHwiGhh9l1Nwt7EIO1
	/EtYAkt5pRoosEPnsjJrVBk6/ZbX5zvLJTF57nK1LM50Hbvc39oHoFeZmUcfad/l5DQUpPFEDsV
	xJjBkQQ0/JT0HlSbeItNDNmNG/UtH3wsY8fG9
X-Gm-Gg: AYBFou1XAhlePjrTvBTRbh8hnx/1O4dIyLUDxJBo8S97ab/M25ZhlCHbygXuns5UhJL
	pbETrhI2JJIYX0rsrEZzI+u8tb7UD8jKwH9IPibcqogOfBwd+it/kw5Hmcl8p0DLe+decc5ijsZ
	dbvvolmMuJQ2Tu16mviXBDylSEm2UK6rlCFRPK7UDgGrHcV4oevaHakIHPVFS0CaSJx1JZ0LMN4
	3gRW44jP9V/+Yi9GaIl/xay/RKFEMNEqt3IcfVWJczoT5zXZwl/3D2EHDcTB6blQv4c727VC+W8
	VQnMs8GZC8wfusyWN2DbUQJDMt3E01gNEPn/oJDNkwBHV8lF0uZTMN8th+C66lhPVFvrfTIuBc8
	2Qc4EtX9Wfq8=
X-Received: by 2002:a17:90b:258c:b0:396:4c63:7193 with SMTP id
 98e67ed59e1d1-39dbc1d79aamr5456534a91.11.1789218782504; Sat, 12 Sep 2026
 06:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911132850.1580669-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20260911132850.1580669-1-heikki.krogerus@linux.intel.com>
From: Manuel Knitza <manuel.knitza@googlemail.com>
Date: Sat, 12 Sep 2026 15:12:51 +0200
X-Gm-Features: AcwNN1VG3NPrLKVGZf37fWdTZhk_8RRkI8Sk-4YvIrwLJwKOMqD9TfHVXqe6TbU
Message-ID: <CAMRbua5wOXA5Y0eziYsv+-AwFr5Occ+pfb1TCTvYU6GKtiNeEA@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: acpi: Add DMI quirk for Dell XPS platforms
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Tested on a Dell XPS 16 DA16260 (BIOS 1.10.1), which the DMI match hits
("Dell Inc." / "XPS 16 DA16260"). Unmodified patch built and loaded on
7.2.3-arch1-3: alt modes registered go 1 -> 0, the duplicate-altmode and
VDO-mismatch warnings disappear, the new warning appears, all connectors
still register, and a running DisplayPort link (5120x2160@60, HBR3,
4 lanes) is undisturbed by the module swap. The same change backported to
the 5-argument sync_control signature behaves identically on 7.1.8.

Note it does not build on 7.1.x as-is - msg_out/msg_out_size only arrived
in 7.2.

Details, and one caveat worth reading before this is taken as a fix, are
in the bug thread:
https://lore.kernel.org/linux-usb/CAMRbua4oitgPgCXtWKTJa0_5AHbtzLV-47k=nCSP0Rq-Mhpx-w@mail.gmail.com/

Short form of the caveat: with the quirk active, DisplayPort still never
comes back on hotplug or on resume. The quirk removes misleading data,
it does not restore the function.

Am Fr., 11. Sept. 2026 um 15:28 Uhr schrieb Heikki Krogerus
<heikki.krogerus@linux.intel.com>:
>
> On Dell XPS systems, the UCSI firmware incorrectly reports duplicate
> or extra DisplayPort and Thunderbolt alternate mode entries with
> conflicting and malformed VDOs when querying alternate mode details.
> This causes the kernel to retain an invalid VDO descriptor, breaking
> DisplayPort Alternate Mode functionality during hotplug events.
>
> Work around this issue by clearing the UCSI_CAP_ALT_MODE_DETAILS
> feature flag in a DMI quirk matching Dell XPS platforms so that the
> driver does not attempt to register alternate modes on these systems.
>
> Reported-by: Manuel Knitza <manuel.knitza@googlemail.com>
> Closes: https://lore.kernel.org/linux-usb/CAMRbua4xZfsQ0FXsrfq=SCbyZa1n=Aw5UrD3bEaU41d+J3KmXw@mail.gmail.com/
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Hi,
>
> This has to be tested, I'm "guessing" the DMI match.
> Manuel, can you test this?
>
> Thanks,
>
> ---
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 41 ++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 18286d3e9cc59..58cdc07a095eb 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -161,6 +161,39 @@ static const struct ucsi_operations ucsi_gram_ops = {
>         .async_control = ucsi_acpi_async_control
>  };
>
> +static int ucsi_dell_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
> +                                 void *val, size_t len, void *msg_out,
> +                                 size_t msg_out_size)
> +{
> +       int ret;
> +
> +       ret = ucsi_sync_control_common(ucsi, command, cci, val, len,
> +                                      msg_out, msg_out_size);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (UCSI_COMMAND(command) == UCSI_GET_CAPABILITY && val) {
> +               struct ucsi_capability *cap = val;
> +
> +               if (cap->features & UCSI_CAP_ALT_MODE_DETAILS) {
> +                       dev_warn(ucsi->dev,
> +                                "Firmware bug: broken altmode details reporting, disabling\n");
> +                       cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
> +               }
> +       }
> +
> +       return ret;
> +}
> +
> +static const struct ucsi_operations ucsi_dell_ops = {
> +       .read_version = ucsi_acpi_read_version,
> +       .read_cci = ucsi_acpi_read_cci,
> +       .poll_cci = ucsi_acpi_poll_cci,
> +       .read_message_in = ucsi_acpi_read_message_in,
> +       .sync_control = ucsi_dell_sync_control,
> +       .async_control = ucsi_acpi_async_control
> +};
> +
>  static const struct dmi_system_id ucsi_acpi_quirks[] = {
>         {
>                 .matches = {
> @@ -170,6 +203,14 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
>                 },
>                 .driver_data = (void *)&ucsi_gram_ops,
>         },
> +       {
> +               .ident = "Dell XPS",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "XPS"),
> +               },
> +               .driver_data = (void *)&ucsi_dell_ops,
> +       },
>         { }
>  };
>
> --
> 2.50.1
>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191800;
	b=cd573Ged+7Y/WOsglvHybNAcuJyGUakx9uZeyHINafNpjstRNMJf2gT9abLr/ofsXveP
	 vugLud3QriAyn7wKN1rJdJ7ltUIYbcLbDhdqglYGU79CccmWAXjtlcMGijk+ojVgVjvQl
	 4P19d9yHAQm1tdX3F+scMHvveDyx6cRQwoV/+cIDib7CLofnmvPZ3zCFq/3xScoF1FcW2
	 sPZS9aag7BwTv45CIcwsSEDpTFI1jsdv4BIevR8TR9dt24fQFXBd9jvmD3gZ+FYvTwZJh
	 H51VThys3bM3pIfOvWhStYkF7GXdpq5w5NWTVscUKizwURN/zANn5f9/uFiBirkjV8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=blhYmmsPEYfdAi3wMVG4f+bIgUy4vW2WGUgkjgeDvyI=;
	b=MliwncYHzcPlRyFsewSLHzX4B2j8WdMtSvyq2twqcnqKv/F3IZ9WEOf4b8fxBVAMZGJM
	 c+YY8RdL5cQ2kU5lXgDlUYuLggw9cbYohmctR+wYaFcPT6H3rqLhS8cCjhxxBjBJDvLki
	 DnX0WfywlC1lxjrl3kfEKrmTsD5wjTSZdL8MAx/5ev4CRDGCxFVyg7ugBipU9TFsNEwnS
	 YMM/ynP5hA712wD8Oob9yalOgwCPlAZ2h1r/wWzGAmx2T2OdMZNI8qL0DHKaF3Sharc3S
	 T3OlegS85Qhl7q+g7jWaVB56MxomeaKBSG09R9pF7XZGfn7Cra8AscxcyCIwvhmxv7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bUoU8QZj;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECB5606A31C
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 12:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ECB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bUoU8QZj
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e46e449e8so563815f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793191799; x=1793796599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blhYmmsPEYfdAi3wMVG4f+bIgUy4vW2WGUgkjgeDvyI=;
        b=bUoU8QZjFkINbMX4hNXknL+Nw5HooGrWzzTmpcJyHiPEqvGvhAf8hQkq+x4MfEEIvf
         w5rD/bd1BenwzC1V1JOHy/b9rtTZRvWrooFIPry849SgCKzVPkJJ2WXXLb43RjzN6eql
         fJLAh9DMaKgetmoMhGGCkxlaanh7GXVwe4XBTYy/5c8ichBbuMy4/OW25KkYKZDASECo
         widvmsKs6gyy11/9fKWuvzrrbStcQfTNFaTUahcuUuksAXuEmSus1IBSSZYtf6zRBwbR
         C2y4CvET/CB7lSE/ebRQDB6bOYkzfT44dpLdbx4uelILqAnwp5WLML0dWwsW98bmaxFT
         v6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191799; x=1793796599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blhYmmsPEYfdAi3wMVG4f+bIgUy4vW2WGUgkjgeDvyI=;
        b=boeNP46OvIp3GSJzOvJAzFdVFSqQokBta/LzzaocJ45/FdmCznmE1TSukwOzMMwkUb
         Yv04cOfn+7Pxi7WEOQ6eTNCxJqsNKUTzIM3o4pssdFehP5f1+zNTeT1fvnkygphiXVc8
         IR9rtfIvbJqD+eMU0zYidapoB43MlaGWZNvACYC6HcwK5cDoNttyYoVcB9qvNDJIyYFD
         rc/vLHWSvfNW/ezlDfeGXE5yhzZ32R1Yai2/lYJUCEBDpzYi2Go3qKZ9j1RLeMrnjTis
         Dse1cAOjjmUvkv3LuIu8p6c0Xbl7UqvGcm7OIJcLUgKjF+4O7FOf/IpaNKWGMVP5AxBB
         Skhw==
X-Forwarded-Encrypted: i=1; AKwUvBzGlNUadqIPdzYvxiQ1Q7QPWyUUDpq3ygAbIKH8sAt6YIajBtNVuSc6Bb6jyrXbrfqMOX/pdYtD+H0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLINtcBH7Duit2GybH2EoZtqLHkH0//2ekUo7AERV/2rSraoqKg
	XVMCn0yJMIOP8ZzM2wjUnyNzQzCGQvZaeGBLB77YpfX2dxdGDniOmFnwHxFuEwmV6I7pZ/87/tJ
	3DiS9
X-Gm-Gg: AYBFou0Bsie7+VBajxZrSaGiwEr8j4TpVldlC/IpVq4eydx+3lzL5Wv2T2CrW8g/XeD
	cuFDI1CFvvykEX/i1CtKbIeEc6zNdOgiQ9jSlFzqpaP4aBcFvUkeZ6D4f2EitSLos8BBV1vlPy2
	duK1oDCAjarVE+q3DCYiJGVIc+3cyLUWCO6LXJzLfQezyGFKsNOqFP7aap+8RBbuF4DCfI1zPx8
	GmA9go0Ge2Xww3peHh99veu8v7b7YuTJEZb4TrPt7//1Kez92TL0AxqgNNBu7bj8hRFTJm2Agmb
	y8i4ONq6zQG3CdjBfS8LRD+9SQi1AmYB1wzDVq8ye0rpbF3trdkWTiywFw3fwuyHutzx9AioJu+
	hLbAw6w6WD9e4byObNRY9R3XncL7U7Uncg8Pu8CHxtHKi6d3gKf7UIlCTdVwrFgvojESfwWBmiL
	/jM39/9Ky+qirmbCuEv0f/U/lpKTPnHlZchBcfXmVCaSf83UeRzFQAxIrjsFcjGfVVqnYI7yoN8
	5QkyshAU5dX1mNUE7tgQDN/xQIPJ3KvhJcxzdvOgfIBlvwZlqlM5+eR9pRtdN8tQ9GXVuqHgdb/
	eAvvWwUu+IjnuQhk2DYXIat6FWijCyZPm05r5rRimo1znLgsnRRQ583+tY4nZohwj8ln
X-Received: by 2002:a05:6000:4b08:b0:48e:7fb:aed3 with SMTP id ffacd0b85a97d-48e5d2e7354mr5920971f8f.17.1793191798497;
        Wed, 28 Oct 2026 05:49:58 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b5:e001:5d05:908:ac82:a3a1? ([2001:a61:13b5:e001:5d05:908:ac82:a3a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm27572060f8f.14.2026.10.28.05.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:49:58 -0700 (PDT)
Message-ID: <b151f502-6ba7-404e-b7e9-599f5b62622f@suse.com>
Date: Wed, 28 Oct 2026 13:49:57 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] usb: uas: implement .change_queue_depth to allow
 per-device queue depth override
To: Luca Cecchi <luca.cecchi.info@gmail.com>, linux-usb@vger.kernel.org
Cc: linux-scsi@vger.kernel.org, stern@rowland.harvard.edu
References: <20261009080341.295646-1-luca.cecchi.info@gmail.com>
 <20261009081225.304319-1-luca.cecchi.info@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261009081225.304319-1-luca.cecchi.info@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09.10.26 10:12, Luca Cecchi wrote:
> uas_host_template does not implement .change_queue_depth. Because of
> that, the standard sysfs queue_depth attribute stays read-only for
> every UAS device, not just mine: scsi_sysfs.c:sdev_store_queue_depth()
> requires sht->change_queue_depth to be non-NULL before it allows a
> write.
> 
> uas_probe() already defaults can_queue to qdepth - 2, with a comment
> acknowledging that "some bridge firmwares" need extra margin. That
> margin isn't enough for every bridge. Right now the only way to work
> around a bridge that needs more headroom is the IGNORE_UAS quirk,
> which disables UAS entirely and falls back to BOT/usb-storage - a
> large performance cost for a queue-depth problem.
> 
> This patch wires up .change_queue_depth so affected users can lower
> the depth for just their device (e.g. via a udev rule matching
> idVendor/idProduct), without disabling UAS altogether. Default
> behaviour (qdepth - 2) is unchanged unless userspace asks for less.
> 
> Tested against a Lexar ES3 external SSD enclosure (VID:PID 21c4:0003)
> that locks up under sustained heavy concurrent random writes at the
> default queue depth. Capping the depth to 24 via this interface
> eliminated the lockup across 6 consecutive test runs, including a
> continuous 1-hour soak test (1.36TB written, ~822MB/s, no
> uas_eh_abort_handler events).
> 
> v2: guarded against devinfo->qdepth holding a negative error code
>      left over from a failed uas_configure_endpoints() call in
>      uas_post_reset()/uas_reset_resume() (found by Sashiko AI review)
> 
> v3: dropped that guard per Oliver's direct reply - qdepth going
>      negative is a general bug independent of this patch, which he is
>      fixing separately at the source. This patch just happened to hit
>      the symptom; it carries no workaround for it anymore.
> 
>      Trimmed the comment above uas_change_queue_depth() per Alan
>      Stern's feedback - it described the pre-patch state rather than
>      the code itself, which won't be true after this is merged.
> 
>      Also switched devinfo's lookup to sdev->hostdata (same pattern
>      already used by uas_sdev_configure() and the other scsi_device-
>      level callbacks in this file) instead of casting
>      sdev->host->hostdata, which was pushing the line past 80 columns.
> 
>      Re-validated on bare metal with the same Lexar ES3 unit: two
>      6-minute runs of the original load test (24 sync writers,
>      randwrite, 64KiB, direct=1) at 840-843MB/s with zero
>      uas_eh_abort_handler/uas_eh_host_reset_handler events, plus a
>      mixed 70/30 read/write run (614MB/s read + 263MB/s write, zero
>      events) and a run concurrent with a second USB flash drive on the
>      same controller (no effect on throughput or stability).
> 
> Signed-off-by: Luca Cecchi <luca.cecchi.info@gmail.com>Signed-off-by: Oliver Neukum <oneukum@suse.com>

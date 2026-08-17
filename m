Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87E26296
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941471; cv=none; b=r4hpsEJ8mTU+i3EVL02y83oxLOcokz9F/cDrO1mdrekP/8CjabZP4r3hecvb9f1862koVpRIBlr3/wCzVnXMb7hdto3BMbbp8CKyVy5jYXxvMTPrFZbqEqKkSmlZFYjAAYqTKvXHP3644FdRiG7Ttu6CfbX3k9zP2NEhyAbpFww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941471; c=relaxed/simple;
	bh=rHrzNZq9yjb7oJw88T3/0BLm7HOFNxTX2jDVaoM8/sU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DpvwxNETL0M3HurGTkrzWsQ1XXQH9isjclabaw0lgQIzq5NFa8mA/ZXZcUnmd8VDs10cLrAXcSVt1Z8td5FuP0sWo3yTuOUzcqJwk/joQgsAywwqGKYbn3owJuJA13UEwXVWbNW+HH6HoHLUdiuOdoXjNJBxZJOL9DJNFVpxHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk; spf=none smtp.mailfrom=riff.dk; dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b=OKbklK3B; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riff-dk.20251104.gappssmtp.com header.i=@riff-dk.20251104.gappssmtp.com header.b="OKbklK3B"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1611528a12.0
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 21:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20251104.gappssmtp.com; s=20251104; t=1786941468; x=1787546268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XDA1JofLETIUaFSj5pOd13S4Kox0LDgZ9XgXffCUEUU=;
        b=OKbklK3BQB/IGA7PvRckcZgfaT7MC+lnfxB8kK94BNak5+pbOzYAxS3+fcvMeOW/6J
         NUmELdWjjC1eGhXeLCUQv6JEWjtl1XJ3EfhPFGCcvAI060M0hw2oN/4tkzvjuYzMsc41
         0sxz2xq+JS2vnyRKR1nzX5RVGZq1Zu7znnii0JoQ0fmGiiGp1BYO+/LlvFEXzntPT3x2
         YtV0hTXE+D9iTJdhchYNUNyOPiwr+7NlcZYyaZBFE4SZu1vLvtl/MX4R3O9M7SZDG7+9
         ugp5+/8Orsiri0ycxiVEQeihOod3bWuiNanue1noQKGHMa2c+/c+Quko2kyOfs+vm/3s
         sNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786941468; x=1787546268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XDA1JofLETIUaFSj5pOd13S4Kox0LDgZ9XgXffCUEUU=;
        b=RlIL+kJwMF6ilT2+HrMuZP6HjZX9mRHlxDAheQTN8NAhPIuAMwK6obVH8kyGOlL3tH
         KrKrwAuyri6ldSeRGitvzDbovH77rt5py+4yRJhg1ok0DFPLfTQRFeazKGT+KA6Al0ax
         TtfssvnWgvv7HCACfg5jhGC+LcjdQFjiOs1Dy6YIzLRLLoFrcPsKOfxNmCR6oF7leOwn
         c0DHNANMFg8MNK8v2Y+6GYthI7zC2APyF8NMJVS576omTG7jSd+4E/zhnBpcXQxCEs06
         qrIpnchEOqA+/w2k4CoFfnvjKj9Kef9zpgbuYtOBwJW0DHIr7GSCWaettpx7z7sV3+wO
         24CA==
X-Gm-Message-State: AOJu0YwcvGCYnAQKKPuS9BiY96ai/Xe/3JoLD/ehH1VNLbfyxB4/Vr6j
	h6R8lAyxzfz8FdssF1jBYNX1zCUihLMNs13nFy7NR8wSglCHRqpM7zm5UXZj2vil4sc=
X-Gm-Gg: AR+sD11rCHQb4vE5Odqvi4SEwUDmHX3F2+NqPsapxYrPVXp4E3wSsrABioj2/2rKIpK
	JV0exWBZ/uyfg6q+TpQnm1vRxCLDD0mJ3/w7LEq1DRnX8hrK6Fd7wObIf9uOg9jAGAV1yxanRKi
	dOIpHrZeICE6C5H/F6X+7GCoWXLaL3ykjUosh7k6vwZg8pv8gx2Y0XJTT55Lob6ZTwgBcOcQzNr
	3azvqfQGL4FskBhtj2YGMVWdtCkzpFqpn3/9k8je4xd2TbkCrnS5FavmqPBfg8tv5+oYFlhp7Xx
	SwTNj+dJbz0VcZRWl7BdvfYfYeUc5FRwp76dzzkEOlXGX31Jq3g4BvRu4kwFU7Sjyg6sCJ+4qa/
	wozSexLWBBaI8Gf8V5/xh1DppGI7YBpebe9tRwCJs3y3L677jHqW6OtrL40QqHqbQLzrWZcXhf+
	yvEKVjAmlL3pCCZdCKBFsoKqvmbo1zKqfU0ooSYlbsAJq4HgPqEzicNiiRBlsYHDN7FuMYnQ==
X-Received: by 2002:a05:6a20:d52f:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3cc71dc0c94mr26666241637.36.1786941467802;
        Sun, 16 Aug 2026 21:37:47 -0700 (PDT)
Received: from jrx1.tailbfbe03.ts.net ([2603:8000:8e00:53bb:97c9:95f6:460d:335])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415315e2c9sm2054994c88.9.2026.08.16.21.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:37:47 -0700 (PDT)
From: Jacob Riff <jacob@riff.dk>
To: huangwei <huangwei@kylinos.cn>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH] usb: typec: ucsi: retry init when the PPM answers early commands incorrectly
Date: Sun, 16 Aug 2026 21:37:46 -0700
Message-ID: <20260817043746.1449099-1-jacob@riff.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <202608171119200877083@kylinos.cn>
References: <202608171119200877083@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Aug 2026 11:19:24 +0800, huangwei wrote:
> There the commands do complete, but the EC takes longer than the 5s
> hardcoded wait in ucsi_sync_control_common(). The fix for that case is
> already reviewed [1] (thanks Heikki, Fedor), so both failure modes of
> the "PPM not ready during boot" window would be covered:
>
>   - slow answers  -> longer completion timeout [1]
>   - wrong answers -> init retry (this RFC)

Hi Huang Wei,

Thanks for taking a look, and good to see the two failure modes of
the boot window end up with complementary fixes.

> One small question on the -EINVAL retry: ucsi_read_error() also
> returns -EINVAL for UCSI_ERROR_INVALID_CON_NUM / UNREGONIZED_CMD /
> INVALID_CMD_ARGUMENT, which are logged as "possible UCSI driver bug".
> Retrying those is harmless in practice (debug-level logging, bounded
> attempts), but it delays the report of a genuine driver bug from the
> first occurrence to the 100th. Did you consider distinguishing the
> PPM-not-ready case from the real error case, or is the simplicity of
> retrying both worth that trade-off?

I considered it, but by error code the two cases are identical. On
this machine the not-ready PPM answers a valid standard init command
with UNREGONIZED_CMD / INVALID_CMD_ARGUMENT - exactly the codes
ucsi_read_error() maps to "possible UCSI driver bug". So the only
discriminators left are context and persistence, which is what the
patch relies on: the retry exists only in the ucsi_init_work() path
(a runtime -EINVAL is unaffected), the not-ready window has cleared
after a single retry in every boot observed here, and a genuine bug
fails deterministically, exhausts the bounded attempts (100 x 100ms
= 10s with the role switch constants) and still ends in the loud
"PPM init failed, stop trying".

On delaying the report: the "possible UCSI driver bug" message is
dev_err in ucsi_read_error() and this patch does not touch it, so it
still fires on the first occurrence. With the retries a deterministic
bug would print it on every attempt before the final error, so the
cost is a 10 second delay of the final verdict rather than a hidden
report. That seemed a fair price for reusing the existing role switch
retry machinery unchanged.

Best regards,
Jacob

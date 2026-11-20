Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149493;
	b=zh7y6CM5SvrjErQLfiZY2rBWRi8Q474N8TJEbBFsIA4XwKw01urL79F7KXmEABV3S1mM
	 V1ImqwGuXrchCRLo66AD9Rk4+XQ2TC8LqZv8q1oXzJuEnTSgzh8CzlaqDWs+nlIjhC9sK
	 SuBXP+MnJoENc4Ixtc96BULpZpavHwONOvd42wdMp9z/3zerAJCuL3bomJagJoKXdV46t
	 Gb1MBbdyGJk8ejuL1EdgSy3+F8+ZYOl3gXdH0B0KR+8A/5LkA0KdZlDZwG9sTU/aGKH0D
	 2pebfg0Ts3VNsobvDuMMExT1HfXRMD2y4/W2xa5svV+YL5VQyn+uQK+HI+yP1tzfW+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149493;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x1BcjW807TA8JZfGI6Gu/qunr3o1P6w6aIoeeruui6k=;
	b=cMSs+kGmHR4xb3dyQU89UqZz1vtu2UH0Joj0aqbVWmxxY723gV9o+/vZ0RCHftKC+l6X
	 83TnZpyEjIoPfdzKTxlXfkAMQKC7eNczv4djbz9SJBMyPz/iN7LyuRTnuwODsugFQaafV
	 PS5vVjRSHcJijZ4DZ/DtVqKN4OV5yxPaimpK7mqGrHXgBqhTkqyua7g9w63gVEp1slKz0
	 SJgqRZJKRTFiigTOB/D9tb2+i7RBRxxavEHuBEZEIniTgkJw0M4k6VmjmfcS4MPknVu1i
	 Y51cA3ggSd3kCBpZSy7m5SAbfra4zUV1wXsRJCk+891QcMnR3bUKI/4z7+sxiVAfyGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJi4iCDe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65513606A326
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJi4iCDe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8C01F000CA;
	Fri, 20 Nov 2026 04:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795149492;
	bh=x1BcjW807TA8JZfGI6Gu/qunr3o1P6w6aIoeeruui6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TJi4iCDew+UEXD78nnEN1szkf0kV1FC6KVJZ7xH3CNxm0xVq+UZPcmpztp+iYZID+
	 3N5kvjEBJ1qYXhc8x2xrGjkYLw7n6Qtfzvdufidd5BXW84diiAxXhhmhvZUeusFDpx
	 XVSsEyCwF2VzGa/AEDh4u+RO8ljcgKv876yidtVaSzFoNuTkZMf5EYeyEYwJ0IOdPO
	 t3WtcGqlavmHr/IZZ3L5Br9s3GrNh0jsXWa5nvV7kpI4AvUdJPkeEoGxWdMVkMyOn+
	 FAJf09FXTYhilGEcGZtBzTbxvKQTo6Mm3kYybvu9nammTpu13np+LdzjJNvw0yIEBh
	 njVDT37OOExSA==
Message-ID: <sashiko-outbox-224464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_midi2: disable endpoints before freeing
 descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoli Zhang" <26031212468@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
References: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 04:38:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: gadget: f_midi2: missing Fixes trailer in commit message
--

commit d500c7a9c97bc7945c1213bb986d1745dbdddb98
Author: Haoli Zhang <26031212468@stu.xidian.edu.cn>

> usb: gadget: f_midi2: disable endpoints before freeing descriptors
>
> The dummy_hcd driver keeps a pointer to an endpoint descriptor while the
> endpoint is enabled, and its timer dereferences that pointer in
> find_endpoint(). However, f_midi2_unbind() frees the function descriptors,
> while f_midi2_disable() currently only resets operation_mode. When the
> function is removed, an endpoint can therefore remain enabled while its
> descriptor storage is released.
>
> Disable the MIDI 1.0 endpoints and all MIDI 2.0 endpoints from
> f_midi2_disable() before the unbind callback releases the descriptors.
> Keep f_midi2_stop_eps() unchanged so altsetting transitions retain their
> existing request cleanup behavior.
>
> Reported-by: syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D599d4e8994a656eafe15
> Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>

[Severity: Low]
Since this fixes a descriptor use-after-free in f_midi2_disable(), should
the commit message include:

  Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function =
driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120042607.1347=
854-1-26031212468@stu.xidian.edu.cn?part=3D1

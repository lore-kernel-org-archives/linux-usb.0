Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F54F4FA
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746657; cv=none; b=svi65iK/YQNJiNbdRTf9bGir+j5atbzLI1crkfttLsyPhP8Lgm5rzs9TUUuqoAiRU5aoVajzGGasKP3eiV/Olp+BW8jrrae3yH+hUwRbWPIIUhwyneepfLNktYPCTAtCdWj6mi0TX+tfHz/LoOxG3gqXN2C0dUVSepgkdB6iJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746657; c=relaxed/simple;
	bh=swoTS1nzDbKGZXW+UfidtRywpcKtkNm/6CJAqxZW2ic=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f49h+znc2D3g/lW0PZ4OqAr8SLqvYEsL5lZH1Xzf05uhXG8JpeX7NHy5fjiIUdEIIoyuReBHDjM98ZyoOurloyxvXPHPikpsNT29gqgB2UR6YsYRhuHLrDT4qKsZO4ox4dhf88d9WTgoCHe2XwiWzAVulmjc3I+rNVmxNWlaZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/FNAPr+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/FNAPr+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2AB1C116C6
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 18:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770746656;
	bh=swoTS1nzDbKGZXW+UfidtRywpcKtkNm/6CJAqxZW2ic=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U/FNAPr+1vMXUF3oV2KIPXAPgWc2yeYJanxG1Z8LjSxLqqXgc8RFwIhB/LNRu1qV3
	 4HUyQvJkg/EcKNjabhyUZPFRvaV88PA9JqMqpeX0WCcrYJo9fxGrW+XEr1RokG/5XU
	 OLfB+1SWyWDFV7EfTOhaWjVSNXUJ46lJzAnLMZnNKftUzK629rbK//zb7lcp8MFot8
	 MsPnryXqBYZs0fs9mLaF6+t1fyMRqh63zEs1hFGB2sn0NYSx6NfSVWq9J+4A680F4d
	 vREZZh4AoKBGH1wqmSR7wDhyvNK+pYuXKHgN07eTesUBy/evV/GFXWlRZCL19xKxtB
	 j+lTmMkVVji2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB301C3279F; Tue, 10 Feb 2026 18:04:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Tue, 10 Feb 2026 18:04:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mrh@frame.work
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_file_loc
Message-ID: <bug-221073-208809-02DYruI9EB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

mattwork (mrh@frame.work) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|https://github.com/Framewor |
                   |kComputer/SoftwareFirmwareI |
                   |ssueTracker/issues/163      |

--- Comment #1 from mattwork (mrh@frame.work) ---
Update: new finding from GitHub #163.

@davidhubbard isolated iGPU memory allocation as a variable:
- iGPU Memory Size =3D 96GB: 3/4 suspends =3D xHCI dead
- iGPU Memory Size =3D Auto (0.5GB): cannot reproduce

However, my system reproduces at 16GB iGPU allocation. Higher iGPU
memory makes it more likely, but does not eliminate it at lower
settings. This is a severity dial, not an on/off switch.

This makes sense if iGPU memory allocation changes how the PCI root
complex manages power states during s2idle =E2=80=94 the xHCI controller
at c1:00.4 shares the same PCI root as the amdgpu at c1:00.0.

See:
https://github.com/FrameworkComputer/SoftwareFirmwareIssueTracker/issues/16=
3#issuecomment-3874652761

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

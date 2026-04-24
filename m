Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4426280318
	for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777042879; cv=pass; b=umIeH2PP23m0FqEM/ctxXSI6qn1lnkr2/VQGyGRFO84/Z77K0GLqFtJwLX7th1z97BV6z+LvGGpSKMZb2QPmNqA4lufD8Rcma15NvQvlArk7nb18AbbdbMFS4icv+RoqkhaVZ3/OkElnBGZYCfaJI4mU2YqrhaKaEzMsdfwMxwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777042879; c=relaxed/simple;
	bh=CXbFqvQa/OQ4x32D5HAyA0XSxjRRa9O+9EZJBSAdEyQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XUZZTrxjfPNZ/jN9YR2q/WsgvnUB+eSK4yA7ICmV9zV3qKSGGqtvKsapuC7mX8RXIuejj6tSIwZ+mFTcKjhqlHjCh3DleMdBnrnEF8Bklff7lKcr/3wo0Lj4aAGaDPE9PKBnM2QBOJ0xBGrObP5K9vW6RghFL1mnA6qpfomUtfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNkP2gJR; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNkP2gJR"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7927261a3acso71464907b3.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 08:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777042877; cv=none;
        d=google.com; s=arc-20240605;
        b=gczgAgNheH95uxz+HIOzyJ7lcKHim9rhl7ElkVt8+Nr7pdIP7D4BB14gFPhas0ojUu
         iH5n7aWtwkYLb14tqVzdmtRAh8k66DCBVMJJbmh71TR3eItwAaLPdwT5pfzv59ndYzEZ
         z+ZsrwHshnYRUE9FaLa2ZrjksOc3QjtVaM7m5uJtGrWWgPhkuaW3vcdYVl32ajU4ZS4c
         Tv2zMKiTHAmmmWVPsR8a3vmoTEeHpcL2s4C5j6EtNSlnPaO1CbaRJdKBKC2fSUqD6Oty
         CcMzF0Kr36aLriq6gWZi5SoHD4ztasfwWWY/tSO7NV3N7igHeqIf8Tk8bKeDrOGeg64e
         +bsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xT1qKyePeWCShIqPghwksCOMEpSytLylwNTkor6J8n8=;
        fh=BdeaLRZLqCNTJBPWrJqRjSzloUHH/nz0xlel3vHngFg=;
        b=crqc1Cr/TF7dYeWYHxy+/538HaOsrVzxRADxibZzKyy/iPH3VYlHMZfzgiH5Oj1Ufg
         3qCcZhE/THPVjH2XC0g4Hu0c+sr4E3UCG+8SlMeIxrk3Mt/oW4ZqhzNYuDFme6fXl7Mz
         mfbK6p9NcWGTrqORANKoyowoTV/6r1insWad0GgBMBdim51WJRdlNEuMlK+109nK2DAl
         3dzAegUXdIX4C98zY7XOqGrgUT9C457fnw0DIXNQgBQd/lr8Oos7/hiaUiDgm7ZfgvfG
         YOoztA4le7+glMDEIOmINR3zYURj9+qywrJC3LmkrsFCKg2b9D5GP+SiyliYiX8t7Lyj
         ZDsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777042877; x=1777647677; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xT1qKyePeWCShIqPghwksCOMEpSytLylwNTkor6J8n8=;
        b=lNkP2gJRIb9FKu+1GBye6AfiA345Xlrg5TQVj8P1C7tjq5CgLFdJXYEM9TvAu9+cFA
         RRj2kIE5tJJluymOzbSzoOWhMuOO3xdTu3Ar/TdyTMa+OLICRN6iujPTrBvQzX94V4PI
         VhC5vZ1iXnz1T39/oqCQngFtHHUPaZKAWtfMQnqxXA8TQXy5+wM/RgtS8eH+jQyuD6gI
         GL7g+0jBfWydmgtw0JXvu3k+vPeOogpHB98+N+qntGX/PA669Y7fIsywf8POqs3yT5gG
         wLyWqvO4itLeVnG+4CgVsJTbvOoHwe5weMMSqkWLmv0nZe2mcmXZoTUbuqSSPVbmR5sq
         tYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777042877; x=1777647677;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xT1qKyePeWCShIqPghwksCOMEpSytLylwNTkor6J8n8=;
        b=tXrwq1mTUYxQAWU60fvPFVCxi0S8EgwinRCQ+/EhVosB6xbPiw9antT4ix0osw9xlV
         e7BLj0N4ZgPJKCCaY64+6qExQNQm2qJ+KzjeKCr7NcggLxES0k5KXPxL+SoHGIQdZytX
         UKf98rekE+r7r88qaUqE7A1fqbjIdAdKQcv/dWzfl/Jfn8qKp5g/L0jPhebdWJ2OroM5
         LuC/+UQqI62pWNpxAAjPEXyFuaZdn2zuEzhRzJLko3Hnj9BbpORLj5BK2clgOUyngMJg
         2J67i0l8vPQHGXXPAefc/Fx5kv2zfUWkBb3+qdRqolVE18+ebQX1KIOcbp/ik7JnFzzg
         gy3g==
X-Gm-Message-State: AOJu0YyliDKVq2mWKCZMm7EIfv0HvBrN+j+jbQ4e5qxfobcACvEg3JV6
	Y7sY2AmDDgMcJoz9Xa9kIPTekYd6+2YxtJoxcs5Mj3ITLRBUfvGdnuY6dEHZZrXH7M06cUttvdt
	z7TjW+c0V9Dac3n2DNCGqM6k0LEns+N0=
X-Gm-Gg: AeBDieuTjuCs0WdC7pEnfGykcRmg1ejEi8KvY9uZmaBfyHzJCchPDo2k2paqsTrWa8P
	1/7prGUoDnHk4vXmx3ASAlodeVDl/ThpscgAf5ojKzwlXIfG/s5kI1CeZfwrjZgUjHNrHsEOwoF
	vlhQ5o2M/wN5r4i+r46xDCzBc5UjicfltJ+QUz+156q5nzeavsDexxIIjwqoAIj8mp4Gei9SPus
	d2EBioiv0YCMr40LgY+otMcoyCBt3TyLjzWqQzGUheJQt/ZakDCGl91U0yltIXELsYlfZnOG6Ug
	Y6/BJ7Celu2WUMPZyQ==
X-Received: by 2002:a05:690c:13:b0:79b:cced:2349 with SMTP id
 00721157ae682-7b9ecfc5f17mr325560967b3.37.1777042875316; Fri, 24 Apr 2026
 08:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Fri, 24 Apr 2026 23:01:04 +0800
X-Gm-Features: AQROBzAcDxA3cMbpH2jOPjTfAxvHP9n7PqR2MGpxfScyljxT6789WvCxzckNVIg
Message-ID: <CAGp+u1atc_x1o18+Jk+0N+rWnN_RzmWYDAXT=H+oq8jwNdqLEg@mail.gmail.com>
Subject: [bug report] Potential order bug in 'drivers/usb/misc/yurex.c',
 mainly in 'yurex_disconnect()'
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux kernel maintainers,

My research-based static analyzer found a potential orderbug within
the 'drivers/usb/misc' subsystem, more specifically, in
'drivers/usb/misc/yurex.c'.

Kernel version: long-term kernel v6.18.9

Potential concurrent triggering executions:
T0:
yurex_disconnect
    --> usb_set_intfdata(interface, NULL); [t0]
    --> usb_deregister_dev(interface, &yurex_class);
         --> usb_minors[intf->minor] = NULL; [t2]
T1:
usb_open
   --> new_fops = fops_get(usb_minors[iminor(inode)]); [t1]
   --> err = file->f_op->open(inode, file);
       --> ...
       --> yurex_open
             --> dev = usb_get_intfdata(interface); [t3]

In T0, the interface is nullified before its get deregistered. Thus,
it is possible for T1 to still get the usb dev and access it via the
interface, which, however, has been already nullified.
The concurrent buggy order is t0 -> t1 -> t2 -> t3.

Thank you for your time and consideration.

Sincerely,
Ginger
